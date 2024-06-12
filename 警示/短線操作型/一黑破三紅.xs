{@type:sensor}
input:periods(20);setinputname(1,"計算期數(最小為5)");
input:ratio(20);setinputname(2,"累計漲幅%");

settotalbar(5);
setbarback(Periods);

variable:x(0);

if periods < 5 then return;

condition1=false;
condition2=false;
condition3=false;

if (high[1] - low[periods-1])/low[periods-1] >= ratio*0.01 
then condition1=true//近n日漲幅超過?%
else return;

if high>highest(high[1],3) and c<lowest(low[1],3)
then condition2=true//開盤是四日來新高但收盤比三日前低點低
else return;

//前二天每天比前一天上漲且連續三天收紅棒
condition3 = TrueAll(c[1]>c[2], 2) and
			 TrueAll(open[1]<close[1], 3); 

if condition1 and condition2 and condition3
then ret=1;


