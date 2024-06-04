{@type:sensor|@guid:0d56426ab022422baf5720e5a810428c|@path:/3.出場常用警示/高檔覆蓋線|@hash:557e8649f669ed63c744fb39dce20b40}
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