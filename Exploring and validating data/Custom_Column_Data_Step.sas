***********************************************************;
*                                                         *;
*    1) Add an assignment statement to create StormLength *;
*       that represents the number of days between        *;
*       StartDate and EndDate.                            *;
*    2) Run the program. In 1980, how long did the storm  *;
*       named Agatha last?                                *;
***********************************************************;

data storm_length;
	set input.storm_summary;
	drop Hem_EW Hem_NS Lat Lon;
	*Add assignment statement;
	StromLength = EndDate - StartDate+1;
run;



***********************************************************;
*                                                         *;
*    1) Open the PG1.STORM_RANGE table and examine the    *;
*       columns. Notice that each storm has four wind     *;
*       speed measurements.                               *;
*    2) Create a new column named WindAvg that is the     *;
*       mean of Wind1, Wind2, Wind3, and Wind4.           *;
*    3) Create a new column WindRange that is the range   *;
*       of Wind1, Wind2, Wind3, and Wind4.                *;
***********************************************************;

data storm_wingavg;
	set input.storm_range;
	*Add assignment statements;
	WindAvg = MEAN(Wind1, Wind2, Wind3, Wind4);
	WindRange = Range(of Wind1 - Wind4);
run;
