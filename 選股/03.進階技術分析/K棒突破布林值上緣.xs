{@type:filter}
Input: 
	Length(20, "期數"), 
	UpperBand(2, "通道上緣");

settotalbar(3);

Ret = close >= bollingerband(Close, Length, UpperBand);