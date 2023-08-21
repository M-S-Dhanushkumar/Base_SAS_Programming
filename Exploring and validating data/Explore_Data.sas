
libname libref "S:/workshop/EPG1V2/data";

/*  */
/* list first 20 rows */
/* proc print data=pg1.np_summary(obs=20); */
/*     var Reg Type ParkName DayVisits TentCampers RVCampers; */
/* run; */
/*  */
/* calculate summary statistics */
/* proc means data=pg1.np_summary; */
/*     var DayVisits TentCampers RVCampers; */
/* run; */
/*  */
/* examine extreme values */
/* proc univariate data=pg1.np_summary; */
/*     var DayVisits TentCampers RVCampers; */
/* run; */
/*  */
/* list unique values and frequency counts */
/* proc freq data=pg1.np_summary; */
/*     tables Reg Type; */
/* run; */
