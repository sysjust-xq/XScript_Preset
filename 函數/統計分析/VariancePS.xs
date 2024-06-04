{@type:function|@guid:9c4f476d319b4f109a8dc8557099ded4|@path:/統計分析/VariancePS|@hash:1ead4c7a9dc2388cd65d182e3ac5cdc5}
SetBarMode(1);

input:  thePrice(numericseries), Length(numericsimple), DataType(numericsimple);

variable:  Period(0), sum(0), avg(0);

VariancePS = 0;
Period = Iff(DataType = 1, Length, Length - 1);
if Period > 0 then
begin  
	avg = Average(thePrice, Length);
	sum = 0;
	for Value1 = 0 to Length - 1
	begin
		sum = sum + Square(thePrice[Value1] - avg);
	end;
	VariancePS = sum / Period;
end;
        