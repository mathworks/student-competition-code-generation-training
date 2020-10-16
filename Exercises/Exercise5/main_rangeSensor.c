#include <stddef.h>
#include <stdio.h>                     /* This ert_main.c example uses printf/fflush */
#include "rangeSensor.h"           /* Model's header file */
#include "rtwtypes.h"

int_T main(int_T argc, const char *argv[])
{
  
  /* For file reading */
  FILE *f;
  char str[30];
  /* Entry-point I/O */
  double time;
  double sensShort;
  double sensLong;
  double sensFused;
  /* Timing counter */
  int counter;
    
  /* Initialize */
  counter = 0;
  rangeSensor_initialize();
  f = fopen("rangeSensorData.txt","r");

  /* Main loop */
  while(!feof(f)) {
    /* Read a line from the file */
    fgets(str,30,f);
    sscanf(str,"%lf,%lf,%lf",&time,&rangeSensor_U.sensShort,&rangeSensor_U.sensLong);
    
    /* Call generated code, with timing */
    rangeSensor_step0();
    if (counter == 0) {
      rangeSensor_step1();
    }
    counter++;
    if (counter == 5) {
      counter = 0;   
    }
    
    /* Print results */
    printf("Time: %f, Inputs: [%f %f], Output: %f\n",
           time, rangeSensor_U.sensShort,
           rangeSensor_U.sensLong, rangeSensor_Y.sensFused);
  }  

  /* Terminate model */
  rangeSensor_terminate();
  fclose(f);
  
  return 0;
}