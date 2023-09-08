/* Define a macro named 'export_wcoid' with a parameter 'dsn' */
%macro export_wcoid(dsn=);
    /* Define a library named 'input' pointing to a specific directory */
    libname input"C:\your\directory\path"; 

    /* Use 'proc export' to export data from library "input" with the provided 'dsn' */
    proc export data=Tmp1.&dsn.
       /* Specify the output file path with the 'dsn' parameter in the name */
       outfile="C:\your\csv\directory\&dsn..csv"
       /* Specify the export format as CSV and replace the file if it already exists */
       dbms=csv
       replace;
       
       /* Include variable names as the first row in the CSV file */
       PUTNAMES=YES;
    run;
    
    /* End of the 'export_wcoid' macro definition */
%mend;

/* Execute the 'export_wcoid' macro with various 'dsn' values */
%export_wcoid (dsn=ab);
%export_wcoid (dsn=ae);
%export_wcoid (dsn=ba);
%export_wcoid (dsn=bd);
%export_wcoid (dsn=bt);
%export_wcoid (dsn=ca);
/* Add more macro calls with different 'dsn' values as needed */
