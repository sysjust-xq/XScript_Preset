{@type:sensor}
settotalbar(5);

condition1 =  Close[3] > low[3]* 1.01;
condition2 =  close[2] > open[2] * 1.01 and open[2]>close[3];
condition3 =  close[1] < close[2] and high[1] < close[1]* 1.005;
condition4 =  close > close[1] * 1.01;

if condition1 and condition2 and condition3 and condition4 then ret=1;  
