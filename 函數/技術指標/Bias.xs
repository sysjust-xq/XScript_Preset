{@type:function}
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