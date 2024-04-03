/* Import data from Excel file */
proc import 
    datafile='C:\Users\navee\Desktop\DM_Data\Paper_Studies.xlsx'
    out=Input
    dbms=xlsx
    replace;
run;

/* Sort the imported data by study number */
proc sort data=Input;
    by Study_Number;
run;

/* Create the paper_studies dataset */
data paper_studies;
    set Input;
    Data_Manager = DE_Person;
    Activity_type = 'Data Entry';
    output;
    Data_Manager = Data_Validation_Person;
    Activity_type = 'Data Validation';
    output;
run;

/* Reshape the data to include roles and names in separate columns */
data output_data;
    set paper_studies;
    Role = 'Project Lead';
    Name = Global_PoC;
    output;
    Role = 'Lead Data Manager';
    Name = IAC_PoC;
    output;
    Role = 'Data Manager';
    Name = Data_Manager;
    output;

    /* Add Database Build into activity_type column and populate actual start and completion dates */
    Activity_type = 'Database Build';
    actual_start_date = Database_Build_Start_Date;
    actual_completion_date = Database_Build_End_Date;
    output;

    keep Study_Number Category Project_Name Study_Type Batch No_of_Pages Status Database_Build_Start_Date Database_Build_End_Date DMP_Request_Date DMP_Expected_Date DMP_Completed_Date Data_Received Actual_Start_Date SAS_Comparer_Date Actual_Completion_Date Activity_type Role Name;
run;

/* Export the reshaped data to Excel */
proc export 
    data=output_data
    outfile='C:\Users\navee\Desktop\DM_Data\Roles.xlsx'
    dbms=xlsx
    replace;
run;
