/*
 * @Author: Wei Benqiang
 * @Date: 2023-02-07 10:16:49
 * @LastEditors: Do not edit
 * @LastEditTime: 2023-02-07 20:00:23
 * @Description: 
 * @FilePath: /tfhepp/include/params/CGGI19.hpp
 */
#pragma once

#include <cmath>
#include <cstdint>

// Dummy
constexpr uint32_t DEF_tlvl22 = 0;
constexpr uint32_t DEF_basebitlvl22 = 0;

struct lvl0param {
    static constexpr std::uint32_t n = 630;
    static constexpr std::uint32_t k = 1;
    static const inline double alpha = std::pow(2.0, -15);
    using T = uint32_t;
    static constexpr T mu = 1U << 29;
    static constexpr uint32_t plain_modulus = 2;
    static constexpr double delta =
        static_cast<double>(1ULL << std::numeric_limits<T>::digits) /
        plain_modulus;

};

struct lvl1param {
    static constexpr std::uint32_t nbit = 10;
    static constexpr std::uint32_t n = 1 << nbit;//1024
    static constexpr std::uint32_t k = 1;
    static constexpr std::uint32_t l = 3;
    static constexpr std::uint32_t Bgbit = 7;
    static constexpr std::uint32_t Bg = 1 << Bgbit;
    static const inline double alpha = std::pow(2.0, -25);
    using T = uint32_t;
    static constexpr T mu = 1U << 29;
    static constexpr uint32_t plain_modulus = 2;
    static constexpr double delta =
        static_cast<double>(1ULL << std::numeric_limits<T>::digits) /
        plain_modulus;
};

struct lvl2param {
    static const std::uint32_t nbit = 11;
    static constexpr std::uint32_t n = 1 << nbit;
    static constexpr std::uint32_t k = 1;
    static constexpr std::uint32_t l = 4;
    static constexpr std::uint32_t Bgbit = 9;
    static constexpr std::uint32_t Bg = 1 << Bgbit;
    static const inline double alpha = std::pow(2.0, -44);
    using T = uint64_t;
    static constexpr T mu = 1ULL << 61;
    static constexpr uint32_t plain_modulus = 8;
    static constexpr double delta = mu;
};

// Dummy
struct lvl11param {
    static constexpr std::uint32_t t = 0;  // number of addition in keyswitching
    static constexpr std::uint32_t basebit =
        0;  // how many bit should be encrypted in keyswitching key
    static const inline double alpha = lvl0param::alpha;  // key noise
    using domainP = lvl1param;
    using targetP = lvl0param;
};

struct lvl10param {
    static constexpr std::uint32_t t = 8;
    static constexpr std::uint32_t basebit = 2;
    static const inline double alpha = lvl0param::alpha;
    using domainP = lvl1param;
    using targetP = lvl0param;
};

struct lvl21param {
    static constexpr std::uint32_t t = 10;
    static constexpr std::uint32_t basebit = 3;
    static const inline double alpha = std::pow(2, -29);
    using domainP = lvl2param;
    using targetP = lvl1param;
};

// Dummy
struct lvl20param {
    static constexpr std::uint32_t t = 0;  // number of addition in keyswitching
    static constexpr std::uint32_t basebit =
        0;  // how many bit should be encrypted in keyswitching key
    static const inline double alpha = lvl0param::alpha;  // key noise
    using domainP = lvl2param;
    using targetP = lvl0param;
};

// Dummy
struct lvl22param {
    static constexpr std::uint32_t t = 0;
    static constexpr std::uint32_t basebit = 0;
    static const inline double alpha = lvl2param::alpha;
    using domainP = lvl2param;
    using targetP = lvl2param;
};
