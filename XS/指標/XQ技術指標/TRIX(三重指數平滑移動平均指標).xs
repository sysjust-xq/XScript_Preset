{@type:indicator|@guid:d738132b1fff4be4b883407bb28d1168|@path:/XQ技術指標/TRIX(三重指數平滑移動平均指標)|@hash:65045202f22451945cd993a34ae3c57e}
// XQ: TRIX指標
//
input: Length1(9), Length2(15);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Value1 = TRIX(Close, Length1) * 100;
Value2 = TRIX(Close, Length2) * 100;

Plot1(Value1, "TRIX1");
Plot2(Value2, "TRIX2");
		