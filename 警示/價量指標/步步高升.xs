{@type:sensor}
settotalbar(3);
if volume > volume[1]     and 
   volume[1] > volume[2]  and
   close > close[1]       and   
   close[1] > close[2]    and 
   close > open and 
   close[1] > open[1] and 
   close[2] > open[2]
then ret=1; 


 
