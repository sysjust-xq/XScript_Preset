{@type:filter}
setbarfreq("AD");

input:HitTimes(3,"設定觸頂次數");
input:RangeRatio(2,"設定頭部區範圍寬度%");
input:Length(60,"計算期數");

variable: theHigh(0);
variable: HighLowerBound(0);
variable: TouchRangeTimes(0);

//找到過去其間的最高點
theHigh = Highest(High[1],Length);
value1=highestbar(high[1],length);

// 設為瓶頸區間上界
HighLowerBound = theHigh *(100-RangeRatio)/100;

//回算在此區間中 進去瓶頸區的次數
TouchRangeTimes = CountIF(High[1] > HighLowerBound, Length-value1);

Condition1 = TouchRangeTimes >= HitTimes;
Condition2 = close > theHigh;
Condition3 = close[length]*1.2<thehigh;

condition4=false;
if Condition1 and Condition2 and condition3
then condition4=true;

if barslast(condition4=true)=1
then ret=1;

outputfield(1, theHigh, 2, "區間高點", order := -1);
