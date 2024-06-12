{@type:function}
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
        