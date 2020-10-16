/*
 * File: main.c
 *
 * MATLAB Coder version            : 3.4
 * C/C++ source code generated on  : 28-Nov-2017 17:00:19
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/
/* Include Files */
#define _CRT_SECURE_NO_WARNINGS
#include "rt_nonfinite.h"
#include "threshRGB2Lab.h"
#include "main.h"
#include "threshRGB2Lab_terminate.h"
#include "threshRGB2Lab_initialize.h"
#include <stdio.h>

/* Function Declarations */
static void argInit_480x640x3_uint8_T(unsigned char result[921600]);
static unsigned char argInit_uint8_T(void);
static void main_threshRGB2Lab(void);

/* Function Definitions */

/*
 * Arguments    : unsigned char result[921600]
 * Return Type  : void
 */
static void argInit_480x640x3_uint8_T(unsigned char result[921600])
{
  int idx0;
  int idx1;
  int idx2;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 480; idx0++) {
    for (idx1 = 0; idx1 < 640; idx1++) {
      for (idx2 = 0; idx2 < 3; idx2++) {
        /* Set the value of the array element.
           Change this value to the value that the application requires. */
        result[(idx0 + 480 * idx1) + 307200 * idx2] = argInit_uint8_T();
      }
    }
  }
}

/*
 * Arguments    : void
 * Return Type  : unsigned char
 */
static unsigned char argInit_uint8_T(void)
{
  return 0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
static void main_threshRGB2Lab(void)
{
  static unsigned char uv0[921600];
  static boolean_T BW[307200];
  double xnnz;

  /* Initialize function 'threshRGB2Lab' input arguments. */
  FILE *fp;
  
  /* Initialize function input argument 'img'. */
  argInit_480x640x3_uint8_T(uv0);
  
  /* Open last frame file for reading */
  fp = fopen("lastframe.bin", "rb");

  if (fp == NULL)
  {
	  printf("\nCan't open file or file doesn't exist.");
	  exit(0);
  }

  /* Read image */
  fread(uv0, 921600, 1, fp);
  
  /* Call the entry-point 'threshRGB2Lab'. */
  threshRGB2Lab(uv0, BW, &xnnz);
  
  /* Check x-coordinate to verify output of generated code */
  printf("%f\n", xnnz);
    
  /* Close file after reading */
  fclose(fp);
}

/*
 * Arguments    : int argc
 *                const char * const argv[]
 * Return Type  : int
 */
int main(int argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* Initialize the application.
     You do not need to do this more than one time. */
  threshRGB2Lab_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_threshRGB2Lab();

  /* Terminate the application.
     You do not need to do this more than one time. */
  threshRGB2Lab_terminate();
  return 0;
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
