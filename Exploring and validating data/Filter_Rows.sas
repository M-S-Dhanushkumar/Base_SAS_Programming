*Filter Rows using like function and % wild key;
proc print data=pg1.np_summary;
    var Type ParkName;
    where ParkName like '%Preserve%';
run;


*Missing Rows function;
proc print data=pg1.eu_occ;
    where Hotel is missing and ShortStay is missing and 
          Camp is missing;
run;

*Filter greater than values;
Solution:
proc print data=pg1.eu_occ;
    where Hotel > 40000000;
run;


*Using macro variables for filtering the rows
%let ParkCode=YOSE;
%let SpeciesCat=Mammal;

proc freq data=pg1.np_species;
    tables Abundance Conservation_Status;
    where Species_ID like "&ParkCode%" and
          Category="&SpeciesCat";
run;

proc print data=pg1.np_species;
    var Species_ID Category Scientific_Name Common_Names;
    where Species_ID like "&ParkCode%" and
          Category="&SpeciesCat";
run;
*The same results are generated.;


*The UPCASE function can be used to eliminate case sensitivity in character WHERE expressions. Use the UPCASE function on the Location column to include any case of MAIN ENTRANCE.;
proc print data=pg1.np_traffic;
    var ParkName Location Count;
    where Count ne 0 and upcase(Location) like '%MAIN ENTRANCE%';
run;
