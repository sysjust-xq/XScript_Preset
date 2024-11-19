{@type:sensor}
input:HitTimes(3,"設定觸頂次數");
input:RangeRatio(1,"設定頭部區範圍寬度%");
input:Length(20,"計算期數");

settotalbar(300);
setbarback(100);

variable: theHigh(0); 
variable: HighLowerBound(0);  
variable: TouchRangeTimes(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
theHigh = Highest(High[1],Length);  //找到過去區間的最高點
HighLowerBound = theHigh *(100-RangeRatio)/100;  // 設為瓶頸區間上界

//回算在此區間中 進去瓶頸區的次數 
TouchRangeTimes = CountIF(High[1] > HighLowerBound, Length);

value1=tselsindex(10,6);
 
if  TouchRangeTimes >= HitTimes   
and close > theHigh 
and close[50]*1.2 < close[20]
and value1[Z]=1
then ret=1;

 