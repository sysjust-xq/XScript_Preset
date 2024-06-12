{@type:indicator}
if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if GetField("發行張數(張)") <> 0 then begin
	value1 = volume / GetField("發行張數(張)") * 100;
	plot1(value1,"週轉率(%)");
end else 
	noplot(1);