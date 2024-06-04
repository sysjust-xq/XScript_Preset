{@type:filter|@guid:68e9b211b3d9472088e09a1ee9718270|@path:/03.進階技術分析/K棒突破布林值上緣}
Input: 
	Length(20, "期數"), 
	UpperBand(2, "通道上緣");

settotalbar(3);

Ret = close >= bollingerband(Close, Length, UpperBand);