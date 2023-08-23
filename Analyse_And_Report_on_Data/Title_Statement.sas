title "Storm Analysis";
title2 "Summary Statistics for MaxWind and MinPressure";
proc means data=pg1.storm_final;
   var MaxWindMPH MinPressure;
run;
title2 "Frequency Report for Basin";
proc freq data=pg1.storm_final;
   tables BasinName;
run; 

The first title appears above both reports. The second title is replaced for the PROC FREQ output.
