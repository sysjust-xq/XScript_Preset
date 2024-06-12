{@type:indicator}
// XQ 3-6 乖離率
//
input: Length1(3), Length2(6);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Plot1(Bias(Length1) - Bias(Length2), "3-6乖離率(%)");

		