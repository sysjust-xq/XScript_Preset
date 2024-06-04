{@type:indicator|@guid:6a50a1323833494f9d19a30673549db6|@path:/XQ技術指標/ATR (平均真實區域)|@hash:081f6e5588880b8bfde985fb1742b9e6}
// XQ: ATR指標
//
input: Length(14);

SetInputName(1, "天數");

value1 = Average(TrueRange, Length);
Plot1(value1, "ATR");
		