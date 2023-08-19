*Creating library as NP from the path;
LIBNAME NP xlsx "S:/workshop/EPG1V2/data/np_info.xlsx";

*executing Options statement to tweak the compatible column attributes;
OPTIONS VALIDVARNAME=v7;

*Finding the descriptive table properties;
PROC CONTENTS DATA=NP.Parks;
RUN; 

*Clearing temporary library;
LIBNAME NP CLEAR;
