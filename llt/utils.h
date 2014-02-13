#ifndef __UTILS_H_
#define __UTILS_H_



char *uint2str(char *dest, size_t len, uint64_t num, uint32_t base);
int str2int(char *str, size_t len, int64_t *res, uint32_t base);
int isdigit_base(char c, int base);

#define bswap_16(x) (((x) & 0x00ff) << 8 | ((x) & 0xff00) >> 8)

#ifdef __INTEL_COMPILER
#define bswap_32(x) _bswap(x)
#else
#define bswap_32(x) \
     ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >>  8) | \
      (((x) & 0x0000ff00) <<  8) | (((x) & 0x000000ff) << 24))
#endif

STATIC_INLINE u_int64_t ByteSwap64(u_int64_t x)
{
    union { 
        u_int64_t ll;
        u_int32_t l[2]; 
    } w, r;
    w.ll = x;
    r.l[0] = bswap_32 (w.l[1]);
    r.l[1] = bswap_32 (w.l[0]);
    return r.ll;
}
#define bswap_64(x) ByteSwap64(x)
#endif 
