#include <iostream>
#include <filesystem>
#include <vector>
#include <array>
#include <atomic>
#include <cmath>
#include <chrono>
#include <fstream>
#include <memory>
#include <random>
#include <climits>
#include <omp.h>
#include <cassert>

#include <NTL/ZZX.h>
#include <NTL/GF2X.h>
#include <helib/helib.h>
#include <helib/ArgMap.h>
#include <helib/DoubleCRT.h>

#include "random_bit.hpp"
#include "Yus_p.hpp"
#include "tool.hpp"

using namespace std;
using namespace helib;
using namespace NTL;
namespace fs = std::filesystem;
/************************************************************************
  long p;          // plaintext primeplain_mod;
  long m;          // m-th cyclotomic polynomial
  long r;          // Lifting [defualt = 1]
  long bits;       // bits in the ciphertext modulus chain
  long c;          // columns in the key-switching matrix [default=2]
  long d;          // Degree of the field extension [default=1]
  long k;          // Security parameter [default=80]
  long s;          // Minimum number of slots [default=0]
************************************************************************/
// p^d = 1 mod m,d=1,slots=\phi(m)/d=\phi(m);m=65536=2^16,\phi(m)=2^15=32768
// 更一般的，应该有d|ord_p(m)，slots=\phi(m)/ord_p(m)
//!!!!!!!!!!!!!!!!
constexpr long BlockByte = 18; // 分组字节长度
// ===============模式设置================
static bool Rkflag = 1;     // true/1表示乘法，false/0表示加法，指的是随机向量和密钥间的操作
static bool deflag = 0;     // true/1表示进行每一步解密验证，false/0表示不进行每一步解密验证
static bool ompflag = 0;    // true/1表示使用OpenMP并行编码，false/0表示不使用OpenMP并行编码
static bool symkeyflag = 0; // true/1表示对称密钥同态解密验证加密，false/0表示不验证
static bool plainflag = 0;  // true/1表示对称密文同态解密验证，false/0表示不验证
// 参数设置，paramMap[Nr-4][idx]
static constexpr unsigned Nr = 5; // 轮数
constexpr long idx = 0;
constexpr unsigned Sbox_depth = 1 * Nr; // S盒深度
// 当c=2时，Qbits=1.5*bits,当c=3时，Qbits=1.5*bits - 100
// 硬编码参数值
constexpr tuple<long, long, long, long> paramMap[5][8] = {
    {// Nr = 4
     // {p, log2(m), bits, c}
     {65537, 15, 230, 2},   // 0 *
     {163841, 15, 240, 2},  // 1
     {65537, 14, 220, 2},   // 2 *
     {163841, 14, 230, 2},  // 3
     {65537, 15, 350, 2},   // 4
     {163841, 15, 350, 2},  // 5
     {65537, 15, 400, 2},   // 6
     {163841, 15, 400, 2}}, // 7
    {
        // Nr = 5
        // {p, log2(m), bits, c}
        {65537, 15, 240, 2},  // 0 *
        {163841, 15, 280, 2}, // 1
        {65537, 16, 300, 2},  // 2
        {65537, 16, 350, 2},  // 3
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0}          // 填充空位
    },
    {
        // Nr = 6
        // {p, log2(m), bits, c}
        {65537, 16, 340, 2}, // 0 *
        {65537, 16, 360, 2}, //
        {65537, 16, 370, 2},
        {0, 0, 0, 0}, // 填充空位
        {0, 0, 0, 0}, // 填充空位
        {0, 0, 0, 0}, // 填充空位
        {0, 0, 0, 0}, // 填充空位
        {0, 0, 0, 0}  // 填充空位
    },
    {
        // Nr = 7
        // {p, log2(m), bits, c}
        {65537, 16, 380, 2}, // 0 *
        {0, 0, 0, 0},        // 填充空位
        {0, 0, 0, 0},        // 填充空位
        {0, 0, 0, 0},        // 填充空位
        {0, 0, 0, 0},        // 填充空位
        {0, 0, 0, 0},        // 填充空位
        {0, 0, 0, 0},        // 填充空位
        {0, 0, 0, 0}         // 填充空位
    },
    {
        // Nr = 8
        // {p, log2(m), bits, c}
        {65537, 16, 430, 2},  // 0 *
        {786433, 17, 450, 2}, // slots太大，不建议使用
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0},         // 填充空位
        {0, 0, 0, 0}          // 填充空位
    }};
// p=k*m+1
//  2^10=1024,2^11=2048,2^12=4096,2^13=8192,2^14=16384,2^15=32768,2^16=65536,
// 当电脑内存有限时，log2Para_m太大，会导致内存不足，出现terminate called recursively错误，从而终止程序.
// 此外，即使正常运行，由于内存一直临界，会导致程序运行速度变慢，时间测量不准确。

constexpr long log2Para_m = get<1>(paramMap[Nr - 4][idx]) - 0;
constexpr long Para_p = get<0>(paramMap[Nr - 4][idx]);    // plaintext prime
constexpr long Para_m = 1 << log2Para_m;                  // cyclotomic polynomial
constexpr long phi_m = Para_m >> 1;                       // phi(m)=nlsots
constexpr long Para_bits = get<2>(paramMap[Nr - 4][idx]); // bits in the ciphertext modulus chain
constexpr long Para_c = get<3>(paramMap[Nr - 4][idx]);    // columns in the key-switching matrix

//!!!!!!!!!!!!!!!
constexpr unsigned PlainBlock = phi_m - 0; // 明文分组数,应该PlainBlock<=phi_m

// 计算 log2 的 constexpr 函数
constexpr unsigned int log2_constexpr(unsigned long long n, unsigned int p = 0)
{
    return (n <= 1) ? p : log2_constexpr(n / 2, p + 1);
}
constexpr long PlainMod = Para_p;                               // 明文模数
constexpr unsigned Bytebits = log2_constexpr(PlainMod - 1) + 1; // 字节比特长度=ceil(log2(PlainMod-1))

constexpr unsigned BlockSize = Bytebits * BlockByte; // 分组比特长度=BlockByte*Bytebits

static const long PlainByte = BlockByte * PlainBlock; // 明文字节长度
static const long Plainbits = Bytebits * PlainByte;   // 明文比特长度
static const long PlainSize = BlockSize * PlainBlock; // 明文比特长度

static const unsigned NonceSize = 32;                           // Nonce比特长度
static const long counter_begin = 0;                            // 计数器起始值
static const long counter_end = PlainBlock + counter_begin - 1; // 计数器结束值

YusP yusP(PlainMod); // 构建明文对称加密实例

int min_noise_budget(vector<Ctxt> &eData)
{
    int min_noise = 1000;
    for (int i = 0; i < eData.size(); i++)
    {
        int noise = eData[i].bitCapacity();
        if (noise < min_noise)
        {
            min_noise = noise;
        }
    }
    return min_noise;
}
void encodeTo18Ctxt(vector<ZZX> &encData, const vector<long> &data, const EncryptedArray &ea)
{
    long R = data.size() / PlainByte;
    long nCtxt = BlockByte * R;
    long data_size = data.size();
    long ea_size = ea.size();
    encData.resize(nCtxt);
#if (opmflag)
    omp_set_num_threads(12); // 设置线程数为12
#pragma omp parallel for
#endif
    for (long i = 0; i < BlockByte; i++)
    {
        vector<long> slots(ea_size, 0);
        for (long r = 0; r < R; r++)
        {
            for (long j = 0; j < PlainBlock; j++)
            {
                long byteIdx = j * BlockByte + i + r * PlainByte;
                slots[j] = data[byteIdx];
            }
            ea.encode(encData[r * BlockByte + i], slots);
        }
    }
}
// encodeTo18Ctxt对应的解码
void decodeTo18Ctxt(vector<long> &data, const vector<vector<long>> &encData,
                    const EncryptedArray &ea)
{
    long R = encData.size() / BlockByte;
    long data_size = R * PlainByte;
    data.resize(data_size);
    omp_set_num_threads(12); // 设置线程数为12
#pragma omp parallel for
    for (long j = 0; j < PlainBlock; j++)
    {
        for (long r = 0; r < R; r++)
        {
            for (long i = 0; i < BlockByte; i++)
            { // i is the ciphertext number
                // j is the block number in this ctxt
                long byteIdx = j * BlockByte + i + r * PlainByte;
                data[byteIdx] = encData[r * BlockByte + i][j];
            }
        }
    }
}
// 函数：解密并验证密文是否正确，需要解码
// 函数：解密并验证密文是否正确
bool verifyDecryption18(const std::vector<Ctxt> &encryptedVec, const vector<long> &originalVec, const SecKey &secretKey,
                        const EncryptedArray &ea)
{
    auto start_decrypt = std::chrono::steady_clock::now();
    vector<long> decryptedVec;
    std::vector<std::vector<long>> decryptedPolys(encryptedVec.size());
    omp_set_num_threads(12); // 设置线程数为12
#pragma omp parallel for
    for (std::size_t i = 0; i < encryptedVec.size(); ++i)
    {
        ea.decrypt(encryptedVec[i], secretKey, decryptedPolys[i]);
    }
    // 解码
    decodeTo18Ctxt(decryptedVec, decryptedPolys, ea);
    // 验证解密结果
    bool isDecryptedVecCorrect = std::equal(decryptedVec.begin(), decryptedVec.end(), originalVec.begin());
    auto end_decrypt = std::chrono::steady_clock::now();
    std::chrono::duration<double> elapsed_seconds = end_decrypt - start_decrypt;
    std::cout << "Decryption and verification finished! Time: " << elapsed_seconds.count() << "s\n";
    // 如果解密结果不正确，输出第一个错误的位置
    if (!isDecryptedVecCorrect)
    {
        for (size_t i = 0; i < BlockByte; i++)
        {
            if (decryptedVec[i] != originalVec[i])
            {
                std::cout << "Error at position " << i << ": " << decryptedVec[i] << " != " << originalVec[i] << std::endl;
                // break;
            }
        }
    }
    return isDecryptedVecCorrect;
}
void encryptSymKey(vector<Ctxt> &encryptedSymKey, const vector<long> &SymKey, unique_ptr<PubKey> &pk, EncryptedArray &ea)
{
    long nslots = ea.size();
    // 加密
    encryptedSymKey.resize(BlockByte, Ctxt(*pk));
    for (long i = 0; i < BlockByte; i++)
    { // encrypt the encoded key
        vector<long> slotsData(nslots, SymKey[i]);
        ea.encrypt(encryptedSymKey[i], *pk, slotsData);
    }
}
bool verify_encryptSymKey(vector<Ctxt> &encryptedSymKey, const vector<long> &SymKey, const SecKey &secretKey, EncryptedArray &ea)
{
    auto start_decrypt = std::chrono::steady_clock::now();
    vector<long> decryptedSymKey(BlockByte);
    omp_set_num_threads(12); // 设置线程数为12
#pragma omp parallel for
    for (long i = 0; i < BlockByte; i++)
    { // encrypt the encoded key
        vector<long> slotsData;
        ea.decrypt(encryptedSymKey[i], secretKey, slotsData);
        decryptedSymKey[i] = slotsData[0];
    }
    bool isDecryptedSymKeyCorrect = std::equal(SymKey.begin(), SymKey.end(), decryptedSymKey.begin());
    auto end_decrypt = std::chrono::steady_clock::now();
    std::chrono::duration<double> elapsed_seconds = end_decrypt - start_decrypt;
    std::cout << "Decryption and verification finished! Time: " << elapsed_seconds.count() << "s\n";
    return isDecryptedSymKeyCorrect;
}
void HE_M(vector<Ctxt> &eData)
{
    vector<Ctxt> temp = eData;
    for (int i=0;i<10;i++){
    eData[0] += temp[i];}
    for (int i=0;i<10;i++){
    eData[1] += temp[i];}
    eData[0] += temp[1];
}
// Linear transformation
void HE_M2(vector<Ctxt> &eData)
{
    vector<Ctxt> temp = eData;
    Ctxt temp0_1 = temp[0];
    temp0_1 += temp[1];
    Ctxt temp0_2 = temp[0];
    temp0_2 += temp[2];
    Ctxt temp1_2 = temp[1];
    temp1_2 += temp[2];
    Ctxt temp0_1_2 = temp0_1;
    temp0_1_2 += temp[2];
    Ctxt temp3_4 = temp[3];
    temp3_4 += temp[4];
    Ctxt temp3_5 = temp[3];
    temp3_5 += temp[5];
    Ctxt temp4_5 = temp[4];
    temp4_5 += temp[5];
    Ctxt temp3_4_5 = temp3_4;
    temp3_4_5 += temp[5];
    Ctxt temp6_7 = temp[6];
    temp6_7 += temp[7];
    Ctxt temp6_8 = temp[6];
    temp6_8 += temp[8];
    Ctxt temp7_8 = temp[7];
    temp7_8 += temp[8];
    Ctxt temp6_7_8 = temp6_7;
    temp6_7_8 += temp[8];
    Ctxt temp9_10 = temp[9];
    temp9_10 += temp[10];
    Ctxt temp9_11 = temp[9];
    temp9_11 += temp[11];
    Ctxt temp10_11 = temp[10];
    temp10_11 += temp[11];
    Ctxt temp9_10_11 = temp9_10;
    temp9_10_11 += temp[11];
    Ctxt temp12_13 = temp[12];
    temp12_13 += temp[13];
    Ctxt temp12_14 = temp[12];
    temp12_14 += temp[14];
    Ctxt temp13_14 = temp[13];
    temp13_14 += temp[14];
    Ctxt temp12_13_14 = temp12_13;
    temp12_13_14 += temp[14];
    Ctxt temp15_16 = temp[15];
    temp15_16 += temp[16];
    Ctxt temp15_17 = temp[15];
    temp15_17 += temp[17];
    Ctxt temp16_17 = temp[16];
    temp16_17 += temp[17];
    Ctxt temp15_16_17 = temp15_16;
    temp15_16_17 += temp[17];

    eData[0] = temp[2];
    eData[0] += temp3_4_5;
    eData[0] += temp6_8;
    eData[0] += temp9_11;
    eData[0] += temp13_14;
    eData[0] += temp15_16;
    eData[1] += temp[2];
    eData[1] += temp3_5;
    eData[1] += temp6_7;
    eData[1] += temp9_10_11;
    eData[1] += temp12_13_14;
    eData[1] += temp15_16;
    eData[2] += temp0_1;
    eData[2] += temp4_5;
    eData[2] += temp6_7_8;
    eData[2] += temp9_11;
    eData[2] += temp12_13;
    eData[2] += temp15_17;
    eData[3] = temp0_1;
    eData[3] += temp[5];
    eData[3] += temp6_7_8;
    eData[3] += temp9_11;
    eData[3] += temp12_14;
    eData[3] += temp16_17;
    eData[4] += temp0_1;
    eData[4] += temp[5];
    eData[4] += temp6_8;
    eData[4] += temp9_10;
    eData[4] += temp12_13_14;
    eData[4] += temp15_16_17;
    eData[5] += temp0_2;
    eData[5] += temp3_4;
    eData[5] += temp7_8;
    eData[5] += temp9_10_11;
    eData[5] += temp12_14;
    eData[5] += temp15_16;
    eData[6] = temp1_2;
    eData[6] += temp3_4;
    eData[6] += temp[8];
    eData[6] += temp9_10_11;
    eData[6] += temp12_14;
    eData[6] += temp15_17;
    eData[7] += temp0_1_2;
    eData[7] += temp3_4;
    eData[7] += temp[8];
    eData[7] += temp9_11;
    eData[7] += temp12_13;
    eData[7] += temp15_16_17;
    eData[8] += temp0_1;
    eData[8] += temp3_5;
    eData[8] += temp6_7;
    eData[8] += temp10_11;
    eData[8] += temp12_13_14;
    eData[8] += temp15_17;
    eData[9] = temp0_2;
    eData[9] += temp4_5;
    eData[9] += temp6_7;
    eData[9] += temp[11];
    eData[9] += temp12_13_14;
    eData[9] += temp15_17;
    eData[10] += temp0_1_2;
    eData[10] += temp3_4_5;
    eData[10] += temp6_7;
    eData[10] += temp[11];
    eData[10] += temp12_14;
    eData[10] += temp15_16;
    eData[11] += temp0_2;
    eData[11] += temp3_4;
    eData[11] += temp6_8;
    eData[11] += temp9_10;
    eData[11] += temp13_14;
    eData[11] += temp15_16_17;
    eData[12] = temp0_2;
    eData[12] += temp3_5;
    eData[12] += temp7_8;
    eData[12] += temp9_10;
    eData[12] += temp[14];
    eData[12] += temp15_16_17;
    eData[13] += temp0_1;
    eData[13] += temp3_4_5;
    eData[13] += temp6_7_8;
    eData[13] += temp9_10;
    eData[13] += temp[14];
    eData[13] += temp15_17;
    eData[14] += temp0_1_2;
    eData[14] += temp3_5;
    eData[14] += temp6_7;
    eData[14] += temp9_11;
    eData[14] += temp12_13;
    eData[14] += temp16_17;
    eData[15] = temp0_1_2;
    eData[15] += temp3_5;
    eData[15] += temp6_8;
    eData[15] += temp10_11;
    eData[15] += temp12_13;
    eData[15] += temp[17];
    eData[16] += temp0_2;
    eData[16] += temp3_4;
    eData[16] += temp6_7_8;
    eData[16] += temp9_10_11;
    eData[16] += temp12_13;
    eData[16] += temp[17];
    eData[17] += temp1_2;
    eData[17] += temp3_4_5;
    eData[17] += temp6_8;
    eData[17] += temp9_10;
    eData[17] += temp12_14;
    eData[17] += temp15_16;

    eData[0] += temp[3];
    eData[0] += temp6_8;
    eData[0] += temp[9];
    eData[0] += temp[14];
    eData[0] += temp[15];
    eData[1] += temp[1];
    eData[1] += temp[5];
    eData[1] += temp6_7;
    eData[1] += temp[11];
    eData[1] += temp12_13_14;
    eData[1] += temp[16];
    eData[2] += temp[0];
    eData[2] += temp[4];
    eData[2] += temp6_7;
    eData[2] += temp[13];
    eData[2] += temp[15];
    eData[3] += temp[0];
    eData[3] += temp[6];
    eData[3] += temp9_11;
    eData[3] += temp[12];
    eData[3] += temp[17];
    eData[4] += temp[1];
    eData[4] += temp[4];
    eData[4] += temp[8];
    eData[4] += temp9_10;
    eData[4] += temp[14];
    eData[4] += temp15_16_17;
    eData[5] += temp[0];
    eData[5] += temp[3];
    eData[5] += temp[7];
    eData[5] += temp9_10;
    eData[5] += temp[16];
    eData[6] += temp[2];
    eData[6] += temp[3];
    eData[6] += temp[9];
    eData[6] += temp12_14;
    eData[6] += temp[15];
    eData[7] += temp0_1_2;
    eData[7] += temp[4];
    eData[7] += temp[7];
    eData[7] += temp[11];
    eData[7] += temp12_13;
    eData[7] += temp[17];
    eData[8] += temp[1];
    eData[8] += temp[3];
    eData[8] += temp[6];
    eData[8] += temp[10];
    eData[8] += temp12_13;
    eData[9] += temp[0];
    eData[9] += temp[5];
    eData[9] += temp[6];
    eData[9] += temp[12];
    eData[9] += temp15_17;
    eData[10] += temp[2];
    eData[10] += temp3_4_5;
    eData[10] += temp[7];
    eData[10] += temp[10];
    eData[10] += temp[14];
    eData[10] += temp15_16;
    eData[11] += temp[4];
    eData[11] += temp[6];
    eData[11] += temp[9];
    eData[11] += temp[13];
    eData[11] += temp15_16;
    eData[12] += temp0_2;
    eData[12] += temp[3];
    eData[12] += temp[8];
    eData[12] += temp[9];
    eData[12] += temp[15];
    eData[13] += temp0_1;
    eData[13] += temp[5];
    eData[13] += temp6_7_8;
    eData[13] += temp[10];
    eData[13] += temp[13];
    eData[13] += temp[17];
    eData[14] += temp0_1;
    eData[14] += temp[7];
    eData[14] += temp[9];
    eData[14] += temp[12];
    eData[14] += temp[16];
    eData[15] += temp[0];
    eData[15] += temp3_5;
    eData[15] += temp[6];
    eData[15] += temp[11];
    eData[15] += temp[12];
    eData[16] += temp[2];
    eData[16] += temp3_4;
    eData[16] += temp[8];
    eData[16] += temp9_10_11;
    eData[16] += temp[13];
    eData[16] += temp[16];
    eData[17] += temp[1];
    eData[17] += temp3_4;
    eData[17] += temp[10];
    eData[17] += temp[12];
    eData[17] += temp[15];
}
// Compute Sbox
void HE_Sbox(vector<Ctxt> &eData)
{
    // for (int i = 0; i < eData.size(); i++)
    // {
    //     eData[i].cleanUp();
    // }
    // (x0,x1,x2)——> (x0,x0*x2+x1,-x0*x1+x0*x2+x2)
    Ctxt c01 = eData[1];
    Ctxt c02 = eData[2];
    c01 = eData[1];
    c01.multiplyBy(eData[0]);

    c02 = eData[2];
    c02.multiplyBy(eData[0]);

    eData[1] += c02;
    eData[2] -= c01;
    eData[2] += c02;
    // omp_set_num_threads(12); // 设置线程数为12
    // #pragma omp parallel for
    for (long j = 3; j < BlockByte; j += 3)
    {
        c01 = eData[j + 1];
        c01.multiplyBy(eData[j]);

        c02 = eData[j + 2];
        c02.multiplyBy(eData[j]);

        eData[j + 1] += c02;
        eData[j + 2] -= c01;
        eData[j + 2] += c02;
    }
}
int main()
{
    std::cout << "Nr: " << Nr << std::endl;
    //=============客户端offline阶段================
    // 定义初始向量
    vector<long> IV(BlockByte);
    for (unsigned i = 0; i < BlockByte; i++)
    {
        IV[i] = i + 1;
    }
    // 生成随机对称密钥
    GF2X rnd;
    int Bytebitsdiv8 = ceil(Bytebits / 8);
    vector<uint8_t> SymKey0(Bytebitsdiv8 * BlockByte);
    random(rnd, 8 * SymKey0.size());
    BytesFromGF2X(SymKey0.data(), rnd, SymKey0.size());
    vector<long> SymKey(BlockByte);
    for (unsigned i = 0; i < BlockByte; i++)
    {
        SymKey[i] = 0;
        for (unsigned j = 0; j < Bytebitsdiv8; j++)
        {
            SymKey[i] += (SymKey0[Bytebitsdiv8 * i + j] << (8 * j));
        }
        SymKey[i] %= PlainMod;
    }

    std::cout << "SymKey generated." << std::endl;
    //========
    // Generating symmetric key and key stream
    auto start_keyStream = std::chrono::steady_clock::now();

    std::vector<long> NonceSet(PlainBlock);
    std::vector<long> Xset(PlainByte * (Nr + 1));
    std::vector<long> RoundKeySet(PlainByte * (Nr + 1));
    std::vector<long> KeyStream(PlainByte);

    long total_tasks = counter_end - counter_begin + 1;
    std::atomic<long> completed_tasks(0);
    // 定义进度打印的粒度，例如每完成 1% 的任务打印一次
    long progress_step = total_tasks / 100;
    if (progress_step == 0)
        progress_step = 1; // 防止除零
    RandomBit<BlockSize> randomBit(Nr);
    std::cout << "Generating KeyStream..." << std::endl;
    omp_set_num_threads(12); // 设置线程数为12
#pragma omp parallel for firstprivate(randomBit)
    for (long counter = counter_begin; counter <= counter_end; counter++)
    {
        long nonce = generate_secure_random_int(NonceSize);
        randomBit.generate_Instance_all_new(nonce, counter);
        auto &RanVecs = randomBit.roundconstants;
        // long nonce = counter;
        // std::vector<std::bitset<544>> RanVecs(Nr + 1);

        NonceSet[counter - counter_begin] = nonce;
        // 使用 std::array 代替 vector 并固定大小
        std::vector<long> state(BlockByte); // 初始化 state

        // 逐轮进行加密
        for (unsigned r = 0; r <= Nr; r++)
        {
            std::vector<long> X(BlockByte);
            std::vector<long> RoundKey(BlockByte);
            uint64_t temp;
            // 计算 X 和 RoundKey
            for (unsigned i = 0; i < BlockByte; ++i)
            {
                bool bit_array[Bytebits];
                for (unsigned j = 0; j < Bytebits; ++j)
                {
                    bit_array[j] = RanVecs[r][i * Bytebits + j];
                }
                BinStrToHex(bit_array, temp, Bytebits);
                // 强制转换为 long 类型
                X[i] = static_cast<long>(temp % PlainMod);
                if (Rkflag)
                {
                    RoundKey[i] = (SymKey[i] * X[i]) % PlainMod;
                }
                else
                {
                    RoundKey[i] = (SymKey[i] + X[i]) % PlainMod;
                }
            }

            // 将 X 和 RoundKey 复制到 Xset 和 RoundKeySet
            memcpy(&Xset[PlainByte * r + BlockByte * (counter - counter_begin)], X.data(), BlockByte * sizeof(long));
            memcpy(&RoundKeySet[PlainByte * r + BlockByte * (counter - counter_begin)], RoundKey.data(), BlockByte * sizeof(long));
            if (r == 0)
            { // 初始轮
                for (unsigned i = 0; i < BlockByte; i++)
                {
                    state[i] = (RoundKey[i] + IV[i]) % PlainMod;
                }
            }
            else if (r < Nr)
            {                       // 常规轮
                yusP.M18_8(state);  // 线性变换
                yusP.Sbox_8(state); // S盒
                for (unsigned i = 0; i < BlockByte; i++)
                {
                    state[i] = (state[i] + RoundKey[i]) % PlainMod;
                }
            }
            else
            {                       // 最后一轮
                yusP.M18_8(state);  // 线性变换
                yusP.Sbox_8(state); // S盒
                yusP.M18_8(state);  // 线性变换
                for (unsigned i = 0; i < BlockByte; i++)
                {
                    state[i] = (state[i] + RoundKey[i]) % PlainMod;
                }
                memcpy(&KeyStream[(counter - counter_begin) * BlockByte], state.data(), BlockByte * sizeof(long));
            }
        }

        // 更新已完成的任务数
        long local_completed = ++completed_tasks;

        // 定期打印进度
        if (local_completed % progress_step == 0 || local_completed == total_tasks)
        {
#pragma omp critical
            {
                std::cout << "Progress: " << (local_completed * 100) / total_tasks << "% completed.\r" << std::flush;
            }
        }
    }
    std::cout << std::endl; // 完成后换行

    auto end_keyStream = std::chrono::steady_clock::now();
    std::chrono::duration<double> elapsed_seconds_keyStream = end_keyStream - start_keyStream;
    std::cout << "KeyStream Generation time: " << elapsed_seconds_keyStream.count() << "s\n";

    // Generating Public Key and encrypting the symmetric key

    long p = Para_p;
    long m = Para_m;
    long r = 1;
    long bits = Para_bits;
    long c = Para_c;
    long d = 1; // slots = phi(m)/d = phi(m) = 32768 = PlainBlock
    long k = 128;
    long s = 1;

    if (!m)
        m = FindM(k, bits, c, p, d, s, 0);
    auto start = std::chrono::steady_clock::now();

    // Context context = ContextBuilder<BGV>()
    //                                 .m(m)
    //                                 .p(p)
    //                                 .r(r)
    //                                 .bits(bits)
    //                                 .c(c)
    //                                 .buildPtr();
    shared_ptr<Context> context(ContextBuilder<BGV>()
                                    .m(m)
                                    .p(p)
                                    .r(r)
                                    .bits(bits)
                                    .c(c)
                                    .buildPtr());
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> elapsed_seconds_context = end - start;
    std::cout << "Context generation time: " << elapsed_seconds_context.count() << "s\n";

    auto start_PubKey = std::chrono::steady_clock::now();
    SecKey secretKey(*context);
    secretKey.GenSecKey();
    unique_ptr<PubKey> publicKey = std::make_unique<helib::PubKey>(secretKey);
    helib::EncryptedArray ea(context->getEA());
    long nslots = ea.size();
    // if (nslots > PlainBlock)
    // {
    //     std::cerr << "nslots > PlainBlock" << std::endl;
    //     return false;
    // }
    std::cout << "p=" << p << std::endl;
    std::cout << "m=" << m << std::endl;
    std::cout << "nslots=" << nslots << std::endl;
    std::cout << "bits=" << bits << std::endl;
    std::cout << "c=" << c << std::endl;
    auto end_PubKey = std::chrono::steady_clock::now();
    std::chrono::duration<double> elapsed_seconds_PubKey = end_PubKey - start_PubKey;
    std::cout << "PublicKey generation time: " << elapsed_seconds_PubKey.count() << "s\n";
    // return 0;
    // 输出 context
    context->printout();
    std::cout << std::endl;
    long Qbits = context->bitSizeOfQ();
    double SecurityLevel = context->securityLevel();
    // 输出 securityLevel
    std::cout << "Security: " << context->securityLevel() << std::endl;

    auto start_keyEncryption = std::chrono::steady_clock::now();
    vector<Ctxt> encryptedSymKey;
    encryptSymKey(encryptedSymKey, SymKey, publicKey, ea);
    auto end_keyEncryption = std::chrono::steady_clock::now();
    double keyEncryption = std::chrono::duration<double>(end_keyEncryption - start_keyEncryption).count();
    std::cout << "SymKey FHE time: " << keyEncryption << "s\n";
    //  解密验证
    if (symkeyflag)
    {
        if (!verify_encryptSymKey(encryptedSymKey, SymKey, secretKey, ea))
        {
            return 0;
        }
        std::cout << "Symmetric key encryption succeeded!" << std::endl;
    }
    // 离线客户端时间=KeyStream Generation time+PublicKey generation and SymKey FHE time
    double total_time_off = elapsed_seconds_keyStream.count() + elapsed_seconds_PubKey.count() + elapsed_seconds_PubKey.count() + keyEncryption;
    std::cout << "Encryption offline total time: " << total_time_off << "s\n";

    //=============服务端offline阶段================
    // 计算 encryptedRoundKeySet
    vector<Ctxt> encryptedRoundKeySet;
    Ctxt tmpCtxt(*publicKey);
    long eRk_len = BlockByte * (Nr + 1);
    encryptedRoundKeySet.resize(eRk_len, tmpCtxt);
    for (int i = 0; i < eRk_len; i++)
    {
        encryptedRoundKeySet[i] = encryptedSymKey[i % BlockByte];
    }
    vector<ZZX> encodedXset;
    auto m1 = std::chrono::steady_clock::now();
    encodeTo18Ctxt(encodedXset, Xset, ea); // encode as HE plaintext
    auto m2 = std::chrono::steady_clock::now();
    double Encode_time = std::chrono::duration<double>(m2 - m1).count();
    std::cout << "encodeTo18Ctxt time: " << std::chrono::duration<double>(m2 - m1).count() << "s\n";

    auto start_RoundKeySet_FHE = std::chrono::steady_clock::now();
    if (Rkflag)
    {
        for (int i = 0; i < eRk_len; i++)
        {
            encryptedRoundKeySet[i].multByConstant(encodedXset[i]);
        }
    }
    else
    {
        for (int i = 0; i < eRk_len; i++)
        {
            encryptedRoundKeySet[i].addConstant(encodedXset[i]);
        }
    }
    auto end_RoundKeySet_FHE = std::chrono::steady_clock::now();
    double RoundKey_time = std::chrono::duration<double>(end_RoundKeySet_FHE - start_RoundKeySet_FHE).count();
    std::cout << "RoundKeySet FHE succeeded! Time: " << RoundKey_time << "s\n";
    // // 使用 verifyDecryption 函数解密并验证 RoundKeySet
    // if (deflag)
    // {
    //     if (!verifyDecryption18(encryptedRoundKeySet, RoundKeySet, secretKey, ea))
    //     {
    //         std::cerr << "Decryption verification failed for RoundKeySet." << std::endl;
    //         return 0;
    //     }
    //     std::cout << "Decryption verification succeeded for RoundKeySet." << std::endl;
    // }
    // 生成 encryptedKeyStream
    // 定义Add_time、Sbox_time、Linear_time
    double Sbox_time = 0, Linear_time = 0, Add_time = 0;

    vector<Ctxt> encryptedKeyStream;
    encryptedKeyStream.resize(BlockByte, tmpCtxt);
    std::copy(encryptedRoundKeySet.begin(), encryptedRoundKeySet.begin() + BlockByte, encryptedKeyStream.begin());

    vector<long> expandedIV(BlockByte * PlainBlock);
    for (long j = 0; j < PlainBlock; j++)
    {
        memcpy(&expandedIV[BlockByte * j], IV.data(), BlockByte * sizeof(long));
    }
    // 对expanded进行simd编码，这样会返回nRoundKeys个多项式数组即encoded，nRoundKeys=encoded.length()
    vector<ZZX> encoded_expandedIV;
    auto m3 = std::chrono::steady_clock::now();
    encodeTo18Ctxt(encoded_expandedIV, expandedIV, ea); // encode as HE plaintext
    auto m4 = std::chrono::steady_clock::now();
    std::cout << "encodeTo18Ctxt time: " << std::chrono::duration<double>(m4 - m3).count() << "s\n";

    std::cout << "whiteround start" << std::endl;
    std::cout << "noise budget: " << min_noise_budget(encryptedKeyStream)<< std::endl;
    auto start_roundkey = std::chrono::high_resolution_clock::now();
    for (long i = 0; i < BlockByte; i++)
    { // encrypt the encoded key
        encryptedKeyStream[i].addConstant(encoded_expandedIV[i]);
    }
    auto end_roundkey = std::chrono::high_resolution_clock::now();
    Add_time += std::chrono::duration<double>(end_roundkey - start_roundkey).count();
    // 输出 Add_time
    std::cout << "whiteround time: " << Add_time << "s\n";
    std::cout << "noise budget: " << min_noise_budget(encryptedKeyStream) << std::endl;
    // 测试
    // vector<Ctxt> test1 = encryptedKeyStream;
    // auto start_test1 = std::chrono::high_resolution_clock::now();
    // for (int i = 0; i < 1000; i++)
    // {
    //     test1[i % 18] = encryptedKeyStream[i % 18];
    // }
    // auto end_test1 = std::chrono::high_resolution_clock::now();
    // double test_time1 = std::chrono::duration<double>(end_test1 - start_test1).count();
    // vector<Ctxt> test2 = encryptedKeyStream;
    // auto start_test2 = std::chrono::high_resolution_clock::now();
    // for (int i = 0; i < 1000; i++)
    // {
    //     test2[i % 18] += encryptedKeyStream[i % 18];
    // }
    // auto end_test2 = std::chrono::high_resolution_clock::now();
    // double test_time2 = std::chrono::duration<double>(end_test2 - start_test2).count();
    // std::cout << "test1 time: " << test_time1 << "s\n";
    // std::cout << "test2 time: " << test_time2 << "s\n";

    // 明文密钥流
    vector<long> KeyStream2(PlainByte);
    if (deflag)
    {
        // 对IV和RoundKeySet进行异或
        for (long i = 0; i < PlainByte; i++)
        {
            KeyStream2[i] = (expandedIV[i] + RoundKeySet[i]) % PlainMod;
        }
        // 使用 verifyDecryption 函数解密并验证 KeyStream
        if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
        {
            std::cerr << "Decryption verification failed for KeyStream." << std::endl;
            return 0;
        }
        std::cout << "Decryption verification succeeded for whiteround." << std::endl;
    }
    auto start_sbox = std::chrono::high_resolution_clock::now();
    auto start_linear = std::chrono::high_resolution_clock::now();
    auto end_sbox = std::chrono::high_resolution_clock::now();
    auto end_linear = std::chrono::high_resolution_clock::now();

    for (long r = 1; r < Nr; r++)
    {
        std::cout << "Round " << r << " start" << std::endl;
        
        start_sbox = std::chrono::high_resolution_clock::now();
        // S Layer
        HE_Sbox(encryptedKeyStream);
        end_sbox = std::chrono::high_resolution_clock::now();
        Sbox_time += std::chrono::duration<double>(end_sbox - start_sbox).count();
        std::cout << "noise budget after Sbox: " << min_noise_budget(encryptedKeyStream) << std::endl;
        if (deflag)
        {
            yusP.Sbox_8(KeyStream2);
            if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
            {
                std::cerr << "Decryption verification failed for KeyStream Sbox." << std::endl;
                return 0;
            }
            std::cout << "Decryption verification succeeded for KeyStream Sbox." << std::endl;
        }
        start_linear = std::chrono::high_resolution_clock::now();
        // Linear Layer
        HE_M(encryptedKeyStream);
        end_linear = std::chrono::high_resolution_clock::now();
        Linear_time += std::chrono::duration<double>(end_linear - start_linear).count();
        std::cout << "noise budget after Linear: " << min_noise_budget(encryptedKeyStream) << std::endl;
        if (deflag)
        {
            for (int i = 0; i < PlainBlock; i++)
            {
                vector<long> tmp(BlockByte);
                for (int j = 0; j < BlockByte; j++)
                {
                    tmp[j] = KeyStream2[i * BlockByte + j];
                }
                yusP.M18_8(tmp);
                for (int j = 0; j < BlockByte; j++)
                {
                    KeyStream2[i * BlockByte + j] = tmp[j];
                }
            }
            if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
            {
                std::cerr << "Decryption verification failed for KeyStream Linear Layer." << std::endl;
                return 0;
            }
            std::cout << "Decryption verification succeeded for KeyStream Linear Layer." << std::endl;
        }
        start_roundkey = std::chrono::high_resolution_clock::now();
        // omp_set_num_threads(12); // 设置线程数为12
        // #pragma omp parallel for
        for (long j = 0; j < BlockByte; j++)
        {
            encryptedKeyStream[j] += encryptedRoundKeySet[r * BlockByte + j];
        }
        end_roundkey = std::chrono::high_resolution_clock::now();
        Add_time += std::chrono::duration<double>(end_roundkey - start_roundkey).count();
        if (deflag)
        {
            for (long i = 0; i < PlainByte; i++)
            {
                KeyStream2[i] = (KeyStream2[i] + RoundKeySet[r * PlainByte + i]) % PlainMod;
            }
            if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
            {
                std::cerr << "Decryption verification failed for KeyStream Round Key Addition." << std::endl;
                return 0;
            }
            std::cout << "Decryption verification succeeded for KeyStream Round Key Addition." << std::endl;
        }
        std::cout << "noise budget: " << min_noise_budget(encryptedKeyStream) << std::endl;
    }
// 最后一轮
#if (1)
    std::cout << "Round " << Nr << " start" << std::endl;
    start_linear = std::chrono::high_resolution_clock::now();
    // Linear Layer
    HE_M(encryptedKeyStream);
    end_linear = std::chrono::high_resolution_clock::now();
    Linear_time += std::chrono::duration<double>(end_linear - start_linear).count();
    if (deflag)
    {
        for (int i = 0; i < PlainBlock; i++)
        {
            vector<long> tmp(BlockByte);
            for (int j = 0; j < BlockByte; j++)
            {
                tmp[j] = KeyStream2[i * BlockByte + j];
            }
            yusP.M18_8(tmp);
            for (int j = 0; j < BlockByte; j++)
            {
                KeyStream2[i * BlockByte + j] = tmp[j];
            }
        }
        if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
        {
            std::cerr << "Decryption verification failed for KeyStream Linear Layer." << std::endl;
            return 0;
        }
        std::cout << "Decryption verification succeeded for KeyStream Linear Layer." << std::endl;
    }
    start_sbox = std::chrono::high_resolution_clock::now();
    // S Layer
    HE_Sbox(encryptedKeyStream);
    end_sbox = std::chrono::high_resolution_clock::now();
    Sbox_time += std::chrono::duration<double>(end_sbox - start_sbox).count();
    if (deflag)
    {
        yusP.Sbox_8(KeyStream2);
        if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
        {
            std::cerr << "Decryption verification failed for KeyStream Sbox." << std::endl;
            return 0;
        }
        std::cout << "Decryption verification succeeded for KeyStream Sbox." << std::endl;
    }
    start_linear = std::chrono::high_resolution_clock::now();
    // Linear Layer
    HE_M(encryptedKeyStream);
    end_linear = std::chrono::high_resolution_clock::now();
    Linear_time += std::chrono::duration<double>(end_linear - start_linear).count();
    if (deflag)
    {
        for (int i = 0; i < PlainBlock; i++)
        {
            vector<long> tmp(BlockByte);
            for (int j = 0; j < BlockByte; j++)
            {
                tmp[j] = KeyStream2[i * BlockByte + j];
            }
            yusP.M18_8(tmp);
            for (int j = 0; j < BlockByte; j++)
            {
                KeyStream2[i * BlockByte + j] = tmp[j];
            }
        }
        if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
        {
            std::cerr << "Decryption verification failed for KeyStream Linear Layer." << std::endl;
            return 0;
        }
        std::cout << "Decryption verification succeeded for KeyStream Linear Layer." << std::endl;
    }
    // add
    start_roundkey = std::chrono::high_resolution_clock::now();
    for (long j = 0; j < BlockByte; j++)
    {
        encryptedKeyStream[j] += encryptedRoundKeySet[Nr * BlockByte + j];
    }
    end_roundkey = std::chrono::high_resolution_clock::now();
    Add_time += std::chrono::duration<double>(end_roundkey - start_roundkey).count();
    if (deflag)
    {
        for (long i = 0; i < PlainByte; i++)
        {
            KeyStream2[i] = (KeyStream2[i] + RoundKeySet[Nr * PlainByte + i]) % PlainMod;
        }
        if (!verifyDecryption18(encryptedKeyStream, KeyStream2, secretKey, ea))
        {
            std::cerr << "Decryption verification failed for KeyStream Round Key Addition." << std::endl;
            return 0;
        }
        std::cout << "Decryption verification succeeded for KeyStream Round Key Addition." << std::endl;
    }
#endif
    std::cout << "noise budget: " << encryptedKeyStream[0].bitCapacity() << std::endl;
    if (encryptedKeyStream[0].bitCapacity() <= 0)
    {
        std::cerr << "noise budget is 0" << std::endl;
        return 0;
    }
    // 输出 Add_time、Sbox_time、Linear_time
    std::cout << "RoundKey time: " << Add_time << "s\n";
    std::cout << "Sbox time: " << Sbox_time << "s\n";
    std::cout << "Linear Layer time: " << Linear_time << "s\n";
    // 计算总时间
    double total_time = Encode_time + RoundKey_time + Add_time + Sbox_time + Linear_time;
    std::cout << "Server offline total time: " << total_time << "s\n";
    // 计算吞吐量,KiB/min
    double throughput = (Plainbits * 60) / (pow(2, 13) * total_time);
    std::cout << "Throughput: " << throughput << "KiB/min\n";

    if (plainflag)
    {
        for (int i = 0; i < encryptedKeyStream.size(); i++)
        {
            encryptedKeyStream[i].bringToSet(encryptedKeyStream[i].naturalPrimeSet());
        }
        if (!verifyDecryption18(encryptedKeyStream, KeyStream, secretKey, ea))
        {
            std::cerr << "Decryption verification failed for KeyStream." << std::endl;
            return 0;
        }
        std::cout << "Decryption verification succeeded for KeyStream." << std::endl;
    }
    // 将total_time, throughput, Nr, p, nslots, bits, c, Add_time, Sbox_time, Linear_time, RoundKey_time写入文件test_Yus_p_C32_ClientAndServer2.txt,如果已存在则追加
    // 检查路径是否存在
    std::string dirPath = "../tests";
    std::string filePath;
    if (!fs::exists(dirPath))
    {
        filePath = "test_Yus_p_C18_ClientAndServer8.txt";
    }
    else
    {
        filePath = "../tests/test_Yus_p_C18_ClientAndServer8.txt";
    }
    std::ofstream outfile(filePath, std::ios::app);
    if (!outfile)
    {
        std::cerr << "Error opening file: " << filePath << std::endl;
        return 0;
    }
    outfile << std::left << std::setw(3) << Nr
            << std::left << std::setw(10) << p
            << std::left << std::setw(10) << nslots
            << std::left << std::setw(5) << bits
            << std::left << std::setw(4) << c
            << std::left << std::setw(6) << Qbits
            << std::fixed << std::setprecision(3)
            << std::left << std::setw(14) << SecurityLevel
            << std::left << std::setw(10) << Encode_time
            << std::left << std::setw(12) << RoundKey_time
            << std::left << std::setw(7) << Add_time
            << std::left << std::setw(8) << Sbox_time
            << std::left << std::setw(10) << Linear_time
            << std::left << std::setw(9) << total_time
            << std::left << std::setw(10) << throughput
            << std::endl;
    outfile.close();
    std::cout << "test_Yus_p_C18_ClientAndServer8.txt updated." << std::endl;
    return 0;
}