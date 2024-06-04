{@type:indicator|@guid:27fe327167114fb687b2c4d860b3d0f9|@path:/XQ技術指標/MA-Osc (移動平均線擺盪指標)|@hash:659e287e3a2dbb8b4d77a0a8a05bb58d}
// XQ: MA-Osc
//
input: Length1(5), Length2(10);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

value1 = Average(close, Length1);
value2 = Average(close, Length2);
value3 = (value1 - value2);

Plot1(value3, "MA-Osc");
		