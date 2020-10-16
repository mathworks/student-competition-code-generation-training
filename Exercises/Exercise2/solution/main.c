/* Task 1: Add include statements for required header files */
#include "speechEnhancement.h"
#include "speechEnhancement_Inputs.h"
#include "speechEnhancement_types.h"
#include <stdio.h>

int main()
{
    int_T i;
    
    /* Task 2: Call entry-point functions for speechEnhancement (Make one call to each entry-point function) */
    speechEnhancement_initialize();
    
    speechEnhancement(y, 1, &par, xHat);
        for (i=0; i<20; i++)
    {
        printf("xHat(%d) = %+f\n", i, xHat[i]);
    }    

    speechEnhancement_terminate();    
    
    /* Print the first 20 elements of the output vector */
 
    return 0;

}

