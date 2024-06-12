{@type:indicator}
// XQ: MAM指標
//
Input: Length(10), Distance(10);
Variable: mam(0);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Value1 = Average(Close, Length);
Value2 = Average(Close, Length)[Distance];

mam = Value1 - Value2;
	
Plot1(mam, "MAM");
		