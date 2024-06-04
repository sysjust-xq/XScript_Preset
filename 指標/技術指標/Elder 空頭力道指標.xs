{@type:indicator|@guid:6015f3356a054df0a37dbffff5d52e16|@path:/技術指標/Elder 空頭力道指標|@hash:bd9f7cd14d979c6339be6470cb7704bd}
// Elder 空頭力道指標
//
input: Length(13);

SetInputName(1, "天數");

Value1 = Low - XAverage(Close, Length);

Plot1(Value1, "空頭");

        
		