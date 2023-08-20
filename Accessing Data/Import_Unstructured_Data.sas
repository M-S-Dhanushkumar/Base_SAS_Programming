*Importing a Comma-Delimited (csv) File;
*Syntax and Example;

*PROC IMPORT DATAFILE="path/filename.csv" DBMS=SCV
             OUT=output-table <REPLACE>;
*     <GUESSINGROWS=n|MAX>;
*RUN;
********************************************;

*Complete the PROC IMPORT step;
proc import datafile="s:/workshop/data/storm_damage.csv" dbms=csv
            out=storm_damage_import replace;
run;

*Complete the PROC CONTENTS step;
proc contents data=storm_damage_import;
run;
**********************************************;

*Importing a tab-Delimited File;
proc import datafile="FILEPATH/storm_damage.tab"
            dbms=tab out=storm_damage_tab;
run; 
