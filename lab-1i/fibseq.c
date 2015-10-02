#include <stdio.h>
#include <stdint.h>

extern int fibonacci(int x);

unsigned ccnt_read ()
{
  volatile unsigned cc;
  asm volatile ("mrc p15, 0, %0, c9, c13, 0" : "=r" (cc));
  return cc;

}

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  unsigned long cycstart, cycend, cyc=0;

  if(argc==0)
    scanf("%d",&number);
  else
  {
    number=atoi(argv[1]);
  }
  cycstart=ccnt_read;
  result = fibonacci(number);
  cycend=ccnt_read;
  cyc=cycend-cycstart;
  printf("fib(%d) = %d , cycle count = %lu\n", number, result,cyc);
}

