{@type:sensor|@guid:a86e69667b9641e5b275543705f5109e|@path:/波段操作型/休息後風雲再起|@hash:a56197169eb45bf2d322d226a61458c8}
settotalbar(5);

condition1 =  Close[3] > low[3]* 1.01;
condition2 =  close[2] > open[2] * 1.01 and open[2]>close[3];
condition3 =  close[1] < close[2] and high[1] < close[1]* 1.005;
condition4 =  close > close[1] * 1.01;

if condition1 and condition2 and condition3 and condition4 then ret=1;  
