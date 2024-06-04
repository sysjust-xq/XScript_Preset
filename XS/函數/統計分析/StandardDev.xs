{@type:function|@guid:c1cda70a714d44999e5171fc53c95b0a|@path:/統計分析/StandardDev|@hash:6057e54db39e06480627d7473776820b}
SetBarMode(1);

input:  thePrice(numericseries), Length(numericsimple), DataType(numericsimple);

Value1 = VariancePS(thePrice, Length, DataType);
if Value1 > 0 then 
	StandardDev = SquareRoot(Value1)
else 
	StandardDev = 0;
        