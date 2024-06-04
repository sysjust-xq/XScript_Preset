{@type:sensor|@guid:61c263c6129140e28fcef9d397448c58|@path:/1.籌碼監控/券增價漲再推升|@hash:95b9d46ed0c30b44fed63c804d88e9ae}
input: pastDays(10); setinputname(1,"近期天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(pastdays + 3);

if BarFreq <> "D" then return;

if  close > high[1] and close > close[1]*(1 + UpRatio/100) and
	Getfield("融券餘額張數")[1] = highest(Getfield("融券餘額張數")[1] ,pastDays)  
then ret=1;
        