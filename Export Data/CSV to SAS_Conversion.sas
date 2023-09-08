/* Step 1: Define a library for input */
libname mydata "C:\your\directory\path"; /* Define the library for your SAS dataset */


/* Step 2: Import a CSV file into a SAS dataset */
proc import datafile="C:\your\csv\directory"
    out=mydata.your_sas_dataset
    dbms=csv
    replace;
    guessingrows=30000;
    getnames=yes;  /* Assumes that the first row of CSV contains variable names */
run;


/* Step 3: Close the libraries */
libname mydata clear;