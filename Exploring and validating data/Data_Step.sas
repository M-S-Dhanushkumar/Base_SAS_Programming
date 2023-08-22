libname libref "S:/workshop/EPG1V2/data";
libname out "S:/workshop/EPG1V2/output";


data out.storm_cat5;
    set libref.storm_summary;
    where StartDate>="01jan2000"d and MaxWindMPH>=156; 
    keep Season Basin Name Type MaxWindMPH; 
run;



data eu_occ2016;
    set input.eu_occ;
    where YearMon like "2016%";
    format Hotel ShortStay Camp comma17.;
    drop geo;
run;

