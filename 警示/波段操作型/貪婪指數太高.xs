{@type:sensor}
input:RSILength(5); setinputname(1,"強弱計算期數");
input:CLength(5); setinputname(2,"比價期數");
input:VLength(20); setinputname(3,"量計算期數");
input:Raise(20); setinputname(4,"累計上揚幅度%");
input: TXT1("僅適用日線"); setinputname(5,"使用限制");
variable : MTRatio(0),CloseRatio(0),AVGV(0);

if barfreq <> "D" then return;

if close > lowest(low,VLength) * (1+Raise/100) then
begin
	MTRatio=getfield("融資增減張數")[1]/volume[1];
	CloseRatio = close/close[CLength];
	AVGV = volume[1]/average(volume[1],VLength);
	value1 = RSI(MTRatio,RSILength)+RSI(CloseRatio,RSILength)+RSI(AVGV,RSILength);
	if RSI(value1,RSILength) >75 then ret=1;
end;