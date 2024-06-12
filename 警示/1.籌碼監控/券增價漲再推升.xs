{@type:sensor}
input: pastDays(10); setinputname(1,"近期天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(pastdays + 3);

if BarFreq <> "D" then return;

if  close > high[1] and close > close[1]*(1 + UpRatio/100) and
	Getfield("融券餘額張數")[1] = highest(Getfield("融券餘額張數")[1] ,pastDays)  
then ret=1;
        