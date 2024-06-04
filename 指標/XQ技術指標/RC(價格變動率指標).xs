{@type:indicator|@guid:84cb11e61d2f4f618afb36bd40af80d5|@path:/XQ技術指標/RC(價格變動率指標)|@hash:357bf31dd61a405236a80d6f20531fa7}
// XQ: RC指標
//
input: Length(12), EMALength(12);

SetInputName(1, "天數");
SetInputName(2, "平滑天數");

value1 = (Close - Close[Length]) / Close[Length];
value2 = XAverage(value1, EMALength);

Plot1(value1, "RC");
Plot2(value2, "ERC");
        
		