data front rear;
    set sashelp.cars;
    if DriveTrain="Front" then do;
        DriveTrain="FWD";
        output front;
    end;    
    else if DriveTrain='Rear' then do;
        DriveTrain="RWD";
        output rear;
    end;    
run;
 
