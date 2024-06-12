{@type:filter}
setbarfreq("AD");

If close[4]=lowest(close,20)
and close[4]*1.2<=close[24]
and open[3]>close[3]*0.01
And close[2]>open[2]*0.01
And close[1]>open[1]*0.01
And close>high[4]
and volume>average(volume,5)
and average(volume,100)>=1000

Then
ret=1;

outputfield(1,close[4],2,"前波低點", order := -1);


