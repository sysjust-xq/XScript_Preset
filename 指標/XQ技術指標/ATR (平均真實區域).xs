{@type:indicator}
// XQ: ATR指標
//
input: Length(14);

SetInputName(1, "天數");

value1 = Average(TrueRange, Length);
Plot1(value1, "ATR");
		