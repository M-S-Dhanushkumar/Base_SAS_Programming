proc import datafile="FILEPATH/np_traffic.dat"
            dbms=dlm
            out=traffic2
            replace;
    guessingrows=3000;
    delimiter="|";
run;