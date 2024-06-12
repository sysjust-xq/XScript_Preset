{@type:indicator}
// XQ: TRIX指標
//
input: Length1(9), Length2(15);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Value1 = TRIX(Close, Length1) * 100;
Value2 = TRIX(Close, Length2) * 100;

Plot1(Value1, "TRIX1");
Plot2(Value2, "TRIX2");
		