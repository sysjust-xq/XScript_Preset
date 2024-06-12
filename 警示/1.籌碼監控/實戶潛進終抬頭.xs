{@type:sensor}
input: pastDays(3); setinputname(1,"計算天數");
input: _BuyRatio(20); setinputname(2,"買超佔比例(%)");
input: length(20); setinputname(3, "整理期間");
input:TXT("僅適用日線"); setinputname(4,"使用限制");

variable: MonthLine(0); //現在的整理期間位置
variable: SumForce(0);
variable: SumTotalVolume(0);
variable: counter(0);

settotalbar(pastdays + 3);

MonthLine = average(close[1],length);

if BarFreq <> "D" then return;

if Close crosses over MonthLine then
begin
  
    counter = summationif(close[1] < MonthLine, 1, pastDays);
    
	if counter  = pastDays then 
	begin
	// 最近一段時間在月線底下的吃貨量
     	SumForce = summationif(close[1] < MonthLine, GetField("實戶買賣超張數")[1], pastDays);
    	SumTotalVolume = Summationif(close[1] < MonthLine, Volume[1], pastDays);
	if SumForce > SumTotalVolume * _BuyRatio / 100  then ret =1;
	end;
end;
