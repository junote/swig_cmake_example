#include "example.h"
#include <cstdio>

void add(int *x, int *y, int *result) {
  *result = *x + *y;
}

void sub(int *x, int *y, int *result) {
  *result = *x - *y;
}

int divide(int n, int d, int *r) {
   int q;
   q = n/d;
   *r = n - q*d;
   return q;
}

void testPointer(int *in, int inSize, int *out, int outSize)
{
  for(int i = 0; i < inSize; ++i)
    {  *(out + i) = *(in + i) * 2;
      //  printf("%d\t%d\n",*(in+i),*(out+i));
    }
}   