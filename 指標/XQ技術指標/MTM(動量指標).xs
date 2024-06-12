{@type:indicator}
// XQ: MTM指標
//
input: Length(10);

SetInputName(1, "天數");

value1 = Momentum(Close, Length); 
if CurrentBar >= Length then
	Value2 = Average(Value1, Length)
else
	Value2 = Value1;
	
Plot1(value1, "MTM");
Plot2(value2, "MA");

        
		