{@type:sensor}
input:HitTimes(3);    setinputname(1,"設定觸頂次數");
input:RangeRatio(1);  setinputname(2,"設定頭部區範圍寬度%");
input:Length(20);     setinputname(3,"計算期數");

settotalbar(Length + 3);

variable: theHigh(0); theHigh = Highest(High[1],Length);  //找到過去其間的最高點
variable: HighLowerBound(0);  HighLowerBound = theHigh *(100-RangeRatio)/100;  // 設為瓶頸區間上界
variable: TouchRangeTimes(0); 							  //期間中進入瓶頸區間的低點次數,每跟K棒要歸0
 
//回算在此區間中 進去瓶頸區的次數 
TouchRangeTimes = CountIF(High[1] > HighLowerBound, Length);
 
if  TouchRangeTimes >= HitTimes   and  ( q_ask> theHigh or   close > theHigh) then ret=1;
 
 