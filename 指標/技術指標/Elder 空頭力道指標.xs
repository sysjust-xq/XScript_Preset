{@type:indicator}
// Elder 空頭力道指標
//
input: Length(13);

SetInputName(1, "天數");

Value1 = Low - XAverage(Close, Length);

Plot1(Value1, "空頭");

        
		