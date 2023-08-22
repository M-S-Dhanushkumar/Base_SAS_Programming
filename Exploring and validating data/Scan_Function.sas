*The SCAN function in SAS is used to extract individual words or tokens from a string based on a specified delimiter. It's often used when dealing with text data that is separated by certain characters, such as spaces or commas. The function takes a string and a positional argument as inputs and returns the specified word or token from the string.;


data np_summary2;
    set pg1.np_summary;
    ParkType=scan(parkname,-1);
    keep Reg Type ParkName ParkType;
run;
