{@type:function}
SetBarMode(1);

input:  thePrice(numericseries), Length(numericsimple), DataType(numericsimple);

Value1 = VariancePS(thePrice, Length, DataType);
if Value1 > 0 then 
	StandardDev = SquareRoot(Value1)
else 
	StandardDev = 0;
        