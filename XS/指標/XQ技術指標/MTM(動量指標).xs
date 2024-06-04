{@type:indicator|@guid:36e64b0960204fdfa7f72b3ab920d8fb|@path:/XQ技術指標/MTM(動量指標)|@hash:de74c10a8839619f7323f30eade3e648}
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

        
		