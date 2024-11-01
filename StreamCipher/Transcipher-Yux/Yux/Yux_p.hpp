#ifndef YUX_P_HPP
#define YUX_P_HPP

#include <cstdlib>
#include <cstdio>
#include <stdint.h>
#include <iostream>
#include <vector>
using namespace std;

static uint64_t roundConstant = 0xCD;

static uint64_t pmod = 65537;

static uint64_t blockByte = 16;

static uint64_t ROUND = 4;

void decSboxFi(uint64_t state[], int begin);

void decLinearLayer(uint64_t in[16]);
/*
class Yux_F_p{

  private:
    int ROUND=4;
    int BlockWords = 16;
    uint64_t Yux_p = 65537;
    uint64_t modulus = 65537;
    

    uint64_t Model_p(uint64_t state);
    void addRoundKey(uint64_t state[], uint64_t RoundKey[], int round);
    void encSboxFi(uint64_t state[], int begin);
    void encLinearLayer(uint64_t in[16]);
    
    void subtractRoundKey(uint64_t state[], uint64_t RoundKey[], int round);
    void decSboxFi(uint64_t state[], int begin);
    void decLinearLayer(uint64_t in[16]);

    void rotation(uint64_t *a, int l,int r);
    void constantForKey(uint64_t RC[56][4]);


  public:
    Yux_F_p(const int b, const int r, const uint64_t p): BlockWords(b), ROUND(r), modulus(p){}
    // YUX_F_P() = default;
    void decryption(uint64_t out[], uint64_t in[], uint64_t RoundKey[]);
    void encryption(uint64_t out[], uint64_t in[], uint64_t RoundKey[]);
    long KeyExpansion(uint64_t RoundKey[], uint64_t Key[]);
    void decRoundKey(uint64_t RoundKey_invert[], uint64_t RoundKey[]);

    vector<vector<uint64_t>> matrix = {
      { 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054 },
      { 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054 },
      { 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054 },
      { 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362 },
      { 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053 },
      { 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053 },
      { 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053 },
      { 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362 },
      { 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054, 53054 },
      { 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054, 53054 },
      { 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363, 53054 },
      { 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9363 },
      { 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054, 53054 },
      { 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054, 53054 },
      { 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363, 53054 },
      { 53054, 53054, 53054, 9363, 53054, 53054, 53054, 9362, 53053, 53053, 53053, 9362, 53054, 53054, 53054, 9363 }
    };

};
*/

#endif // YUX_P_HPP