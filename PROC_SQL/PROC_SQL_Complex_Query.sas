libname input "C:\Users\dhanushkumar.s\Desktop\Test_SAS_Datasets";

data dataset1;
    set input.lb;
run;

data dataset2;
    set input.lab_metropolis;
run;

proc sql;
 create table unmatchingtest as
 select a.SUBJID,
        b.SUBJECT_ID,
        a.LBCAT,
		b.LBCAT as LBCAT2,
        a.LBTEST,
		b.LBTEST as LBTEST2,
        a.VISIT,
		b.VISIT as VISIT2,
		case
          when a.LBTEST = b.LBTEST then "Matching Test"
		  else "Not Matching Test"
		end as Identifier_Column
from dataset1 as a
Full Join dataset2 as b
on a.SUBJID = b.SUBJECT_ID and a.VISIT = b.VISIT and a.LBCAT = b.LBCAT;
/*where not (a.LBCAT is missing and b.LBCAT is  missing);*/
quit;

proc sql;
  create table mismatch_count as 
  select SUBJID, count(case when Identifier_Column = "Not Matching Test" then 1 else 0 end) as Mismatch_count
  from unmatchingtest
  group by SUBJID, VISIT, LBCAT;
quit;



/* Location to CSV */

proc export data=unmatchingtest
  outfile="C:\Users\dhanushkumar.s\Desktop\csv_datasets\unmatchingtest.xlsx"
  dbms=csv
  replace;
run;

proc export data=unmatchingtest
  outfile="C:\Users\dhanushkumar.s\Desktop\csv_datasets\mismatch_count.xlsx"
  dbms=csv
  replace;
run;


/* Export the 'unmatchingtest' table to the first sheet */
proc export data=unmatchingtest
  outfile="output.xlsx"
  dbms=xlsx
  replace;
  sheet="unmatchingtest";
run;

/* Export the 'test_mismatch_counts' table to the second sheet */
proc export data=test_mismatch_counts
  outfile="output.xlsx"
  dbms=xlsx
  replace;
  sheet="test_mismatch_counts";
run;

/* Close the ODS EXCEL destination */
ods excel close;