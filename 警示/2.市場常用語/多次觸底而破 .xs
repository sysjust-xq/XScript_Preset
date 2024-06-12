{@type:sensor}
input:HitTimes(3);    setinputname(1,"設定觸底次數");
input:RangeRatio(1);  setinputname(2,"設定底部區範圍寬度%");
input:Length(20);     setinputname(3,"計算期數");

settotalbar(Length + 3);
 
variable: theLow(0); theLow = lowest(low[1],Length);  //找到過去期間的最低點
variable: LowUpperBound(0);  LowUpperBound = theLow *(100+RangeRatio)/100;  // 設為瓶頸區間上界
variable: TouchRangeTimes(0); TouchRangeTimes=0;  //期間中進入瓶頸區間的低點次數,每根K棒要歸0
variable: ix(0);
 
for ix = length-1  downto 1 
begin
      if Low[ix] < LowUpperBound  then TouchRangeTimes +=1;  //回算在此區間中 進去瓶頸區的次數
end;
 
if  TouchRangeTimes >= HitTimes   and  (q_bid <theLow  or  close < theLow)  then ret=1;
 
 