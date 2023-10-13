proc export data=pg1.storm_final
     outfile="&outpath/storm_final.csv"
     dbms=csv replace
     label;
run; 
