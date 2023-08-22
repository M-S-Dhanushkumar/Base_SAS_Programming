***********************************************************;
*                                                         *;
*    a) Create a new column named SqMiles by multiplying  *;
*       Acres by .0015625.                                *;
*    b) Create a new column named Camping as the sum of   *;
*       OtherCamping, TentCampers, RVCampers, and         *;
*       BackcountryCampers.                               *;
*    c) Format SqMiles and Camping to include commas and  *;
*       zero decimal places.                              *;
*    d) Modify the KEEP statement to include the new      *;
*       columns. Run the program.                         *;
***********************************************************;

data np_summary_update;
	set input.np_summary;
	*Add assignment statements;
	SqMiles = Acres*0.0015625;
	Camping = Sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	Format SqMiles Comma6. Camping Comma9.;
    keep Reg ParkName DayVisits OtherLodging Acres SqMiles Camping;	
run;

