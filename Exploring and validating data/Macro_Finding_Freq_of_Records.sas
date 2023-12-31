*Macro variable to find the frequency of records;

%let cat=Bird;

data &cat;
    set pg1.np_species;
    where Category="&cat";
    drop Abundance Seasonality Conservation_Status;
run;

proc freq data=&cat;
    tables Record_Status;
run;
