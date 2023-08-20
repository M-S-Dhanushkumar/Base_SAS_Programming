proc import datafile="S:/workshop/EPG1V2/data/np_traffic.csv"
            dbms=csv
            out=traffic
            replace;
*guessingrows prevent issues like truncation of text data, incorrect numeric type assignments, and other data-related problems that might arise from insufficient initial scanning.;
    guessingrows=max; 
run;


proc contents data=traffic;
run;