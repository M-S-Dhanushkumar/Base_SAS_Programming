/* Import data from Excel file */
proc import 
    datafile='C:\Users\navee\Desktop\DM_Data\EDC.xlsx'
    out=Input_1
    dbms=xlsx
    replace;
run;

/* Sort the imported data by study number */
proc sort data=Input_1;
    by Study_Number;
run;

data output_data;
    set Input_1;
	Role = 'Lead Data Manager';
    Name = IAC_PoC;
    output;
    Role = 'Project Lead';
    Name = Global_PoC;
    output;
    keep Study_Number Type_of_Study Activity_Type Role Name Status 
Actual_Start_Date Actual_Completion_Date Database_Live_Date Flat_Review_Cycle;
run;

/* Export the reshaped data to Excel */
proc export 
    data=output_data
    outfile='C:\Users\navee\Desktop\DM_Data\EDC_Studies.xlsx'
    dbms=xlsx
    replace;
run;
