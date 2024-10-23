#include <cstring>
#include <stdint.h>
#include <NTL/ZZX.h>
#include <NTL/GF2X.h>

#include <helib/helib.h>
#include <helib/ArgMap.h>
#include <helib/DoubleCRT.h>
#include "../Yux2/Yu2x-8.h"
#include "params.h"

#define PolyType DoubleCRT

using namespace helib;
using namespace std;
using namespace NTL;

static long nBlocks = 12;

// lm: I have set the parameters of idx = 0, 4
static long mValues[][5] = { 
//{ p, phi(m),  m,   d, bits}
  { 2,  512,    771, 16, 960}, // 420, m=(3)*{257}
  { 2, 4096,   4369, 16, 360}, // m=17*(257)
  { 2, 16384, 21845, 16, 410}, // m=5*17*(257)
  { 2, 23040, 28679, 24, 700}, // m=7*17*(241) bits: 600
  { 2, 46080, 53261, 24, 1330}, // m=13*17*(241) bits: 630 
  { 2, 64512, 65281, 48, 480}  // m=97*(673)
};

class Transcipher1
{
public:

// Encode plaintext/ciphertext bytes as native HE plaintext
void encodeTo1Ctxt(Vec<ZZX>& encData, const Vec<uint8_t>& data,
		const EncryptedArrayDerived<PA_GF2>& ea);

// Decode native HE plaintext as Yux plaintext/ciphertext bytes
void decodeTo1Ctxt(Vec<uint8_t>& data, const Vec<ZZX>& encData,
		const EncryptedArrayDerived<PA_GF2>& ea);

void buildRoundConstant(Ctxt& encA,
			const EncryptedArrayDerived<PA_GF2>& ea);

// run the Yux key-expansion and then encrypt the expanded key.
void encryptSymKey(vector<Ctxt>& eKey, Vec<uint8_t>& symKey, const PubKey& hePK,
    const EncryptedArrayDerived<PA_GF2>& ea, bool key2dec);

void buildLinEnc(vector<PolyType>& encLinTran,
			const EncryptedArrayDerived<PA_GF2>& ea);

void buildLinEnc2(vector<PolyType>& encLinTran,
			const EncryptedArrayDerived<PA_GF2>& ea);

void decSboxFunc(Ctxt& c, vector<PolyType> encLinTran, Ctxt& encA, const EncryptedArrayDerived<PA_GF2>& ea);

void decSboxFunc2(Ctxt& c, vector<PolyType> encLinTran, Ctxt& encA, const EncryptedArrayDerived<PA_GF2>& ea);

void Linear_function(Ctxt& c, const EncryptedArrayDerived<PA_GF2>& ea);
void decLinearFunc(vector<Ctxt>& eData, long begin, const EncryptedArrayDerived<PA_GF2>& ea);

void homSymDec(vector<Ctxt>& eData, const vector<Ctxt>& symKey, const EncryptedArrayDerived<PA_GF2>& ea);

// Perform sym encryption on plaintext bytes (ECB mode). The input are
// raw plaintext bytes, and the sym key encrypted under HE. The output
// is a doubly-encrypted ciphertext, out=Enc_HE(Enc_Sym(X)). The symKey
// array contains an encryption of the expanded sym key, the number of
// sym rounds is YuxKey.size() -1.
// NOTE: This is a rather useless method, other than for benchmarking
void homSymDec(vector<Ctxt>& eData, const vector<Ctxt>& symKey,
		       const Vec<uint8_t> inBytes, const EncryptedArrayDerived<PA_GF2>& ea);
};
