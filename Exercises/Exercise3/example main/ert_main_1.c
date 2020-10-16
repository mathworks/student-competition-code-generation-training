#include <stddef.h>
#include <stdio.h>
#include "iir.h"

void main(void)
{
  int_T i;
  
  /* Initialize model */
  iir_initialize();

  /* Step model */
  for(i=0; i<50; i++) {
      iir_U.u = 1;
      iir_step();
      printf("Output[%d] = %f\n",i, iir_Y.y);
  }

  /* Terminate model */
  iir_terminate();
  return 0;
}