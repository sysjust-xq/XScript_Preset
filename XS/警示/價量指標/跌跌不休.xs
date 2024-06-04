{@type:sensor|@guid:60a420b291aa4f31a9265dad3782c417|@path:/價量指標/跌跌不休|@hash:9b5665c92a02cd867173c4a79b312fb7}
settotalbar(5);
if volume > volume[1]     and 
   volume[1] > volume[2]  and
   close < close[1]       and   
   close[1] < close[2]    and 
   close < open and 
   close[1] < open[1] and 
   close[2] < open[2]
then ret=1;  



        
        