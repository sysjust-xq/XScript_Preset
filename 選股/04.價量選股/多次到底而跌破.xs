{@type:filter}
setbarfreq("AD");

input:HitTimes(3,"設定觸底次數");
input:RangeRatio(1,"設定底部區範圍寬度%");
input:Length(20,"計算期數");

variable: theLow(0); 
variable: LowUpperBound(0); 
variable: TouchRangeTimes(0);

//找到過去期間的最低點
theLow = lowest(low[1],Length); 

// 設為瓶頸區間上界
LowUpperBound = theLow *(100+RangeRatio)/100; 

//期間中進入瓶頸區間的低點次數,每根K棒要歸0
TouchRangeTimes = CountIF(Low[1] < LowUpperBound, Length);
 
Condition1 = TouchRangeTimes >= HitTimes;
Condition2 = close < theLow;
Condition3 = Average(Volume, 5) >= 1000;
 
Ret = Condition1 And Condition2 And Condition3;

outputfield(1, theLow, 2, "區間低點", order := -1);

