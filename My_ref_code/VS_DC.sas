/* Import data from Excel file */
proc import 
    datafile='C:\Users\navee\Desktop\DM_Data\Video.xlsx'
    out=Input_2
    dbms=xlsx
    replace;
run;

/* Sort the imported data by study number */
proc sort data=Input_2;
    by Study_Number;
run;

data Video;
    set Input_2;
	Data_Manager = Name_Of_QC_person;
    activity_type = 'Quality Check';
	output;
    Data_Manager = Assessor;
    activity_type = 'Assessor';
    output;
run;

data output_data;
    set Video;

    Role = 'Project Lead';
    Name = Global_PoC;
    output;
	Role = 'Data Manager';
	Name = Assessor;

    output;
    keep Study_Number Type_of_Study Site_Name Role Name Status Phase Species_Name NO__OF_VIDEOS ASSESSOR
 ASSESSOR NAME_OF_QC_PERSON BOXES_ALLOTTED NO_OF_HOURS COUNT_OF_SPECIES Start_Date End_Date activity_type;
run;

/* Export the reshaped data to Excel */
proc export 
    data=output_data
    outfile='C:\Users\navee\Desktop\DM_Data\Video_Assessment.xlsx'
    dbms=xlsx
    replace;
run;
