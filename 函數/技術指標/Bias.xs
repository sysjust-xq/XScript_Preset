{@type:function|@guid:aa300d6ee3de439ea5eeb2f9ff3a7ed2|@path:/技術指標/Bias|@hash:5793fa0c1877bdc59780f052800ec533}
SetBarMode(1);

// Bias function (for 乖離率相關指標)
//
input: length(numericsimple);

value1 = Average(close, length);
if value1 <> 0 then
	Bias = ((close / absValue(value1)) - sign(value1)) * 100
else begin
	if close > 0 then 
		Bias = 999
	else if close < 0 then
		Bias = -999
	else
		Bias = 0;
end;