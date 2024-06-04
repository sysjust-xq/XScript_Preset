{@type:sensor|@guid:16df38a8a46d465585cbf80e085a2d5e|@path:/價量指標/步步高升|@hash:7ef2d3252fa27ba915557d9e6cc815fe}
settotalbar(3);
if volume > volume[1]     and 
   volume[1] > volume[2]  and
   close > close[1]       and   
   close[1] > close[2]    and 
   close > open and 
   close[1] > open[1] and 
   close[2] > open[2]
then ret=1; 


 
