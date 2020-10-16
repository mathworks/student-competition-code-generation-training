#include <stddef.h>
#include <stdio.h>
#include "iir.h"
#include "input_data.h"

void main(void)
{
  int_T i;
  
  /* Initialize model */
  iir_initialize();

  /* Step model */
 for(i=0; i<1001; i++) {
      iir_U.u = external_input[i];
      iir_step();
      printf("Output[%d] = %f\n",i, iir_Y.y);
  }

  /* Terminate model */
  iir_terminate();
  return 0;
}