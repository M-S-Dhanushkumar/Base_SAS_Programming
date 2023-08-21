*sort and create output table name as  np_sort;
proc sort data=pg1.np_summary out=np_sort;
    by Reg descending DayVisits;
    where Type="NP";
run;


*sort data to remove duplicate rows;
proc sort data=pg1.np_largeparks
		  out=park_clean
		  dupout=park_dups
		  nodupkey;
    by _all_;
run;


*lookup table view for detail table.
proc sort data=pg1.eu_occ(keep=geo country) out=countryList 
          nodupkey;
    by Geo Country;
run;
