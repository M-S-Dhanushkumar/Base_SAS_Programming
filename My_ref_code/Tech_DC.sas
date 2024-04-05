/* Import data from Excel file */
proc import 
    datafile='C:\Users\navee\Desktop\DM_Data\Tech.xlsx'
    out=Input_3
    dbms=xlsx
    replace;
run;

/* Sort the imported data by study number */
proc sort data=Input_3;
    by Stability_ID;
run;

/* Create the paper_studies dataset */
data Tech;
    set Input_3;
	Data_Manager = Validation_Person;
    activity_type = 'Data Validation';
	output;
    Data_Manager = DE_Person;
    activity_type = 'Data Entry';
    output;
run;

/* Reshape the data to include roles and names in separate columns */
data output_data;
    set Tech;
	Role = 'Data Manager';
    Name = Data_Manager;
    output;
    
    Role = 'Lead Data Manager';
    Name = POC;
    output;

    keep Stability_ID  Project_Name  Site_CRO Activity Month_batch_number No_of_Pages_received Status No_of_rows_entered Priority
 Data_entry___Validation_Request DMP_Expected_Date DMP_Completed_Date Data_Received Actual_Start_Date Actual_Completion_Date Time_taken_for_DE__Hours_ Time_taken_for_Validation_Hours_ Role Name activity_type;
run;

/* Export the reshaped data to Excel */
proc export 
    data=output_data
    outfile='C:\Users\navee\Desktop\DM_Data\Technical_Development.xlsx'
    dbms=xlsx
    replace;
run;
