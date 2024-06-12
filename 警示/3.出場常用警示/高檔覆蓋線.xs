{@type:sensor}
input: Length(10); setinputname(1,"計算期數");

settotalbar(3);
setbarback(maxlist(Length,42));

value1 = PercentR(14) - 100;
value2 = PercentR(28) - 100;
value3 = PercentR(42) - 100;

if  value1= 0 and value2=0 and value3 =0 then //用威廉指標來表示股價在高檔
begin

variable: HighPoint(0),LowPoint(0),RatioThre(0);
HighPoint = highest(high,length);
LowPoint = Lowest(Low,length);

if HighPoint > LowPoint then
 RatioThre=(HighPoint-close)/(HighPoint-LowPoint)*100
else 
 RatioThre=999;
 
if RatioThre<10 and 
   close<open and 
   close[1]>open[1] and 
   close<close[1]-1/2*(close[1]-open[1])
then ret=1;

end;