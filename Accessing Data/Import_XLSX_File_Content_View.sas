*read the xlsx dataset;
PROC IMPORT DATAFILE="S:/workshop/EPG1V2/data/eu_sport_trade.xlsx"
            dbms=xlsx
            out=eu_sport_trade
            replace;
run;

*view descriptive information about the dataset;
PROC CONTENTS DATA=eu_sport_trade;
run;