{@type:indicator}
// XQ: RC指標
//
input: Length(12), EMALength(12);

SetInputName(1, "天數");
SetInputName(2, "平滑天數");

value1 = (Close - Close[Length]) / Close[Length];
value2 = XAverage(value1, EMALength);

Plot1(value1, "RC");
Plot2(value2, "ERC");
        
		