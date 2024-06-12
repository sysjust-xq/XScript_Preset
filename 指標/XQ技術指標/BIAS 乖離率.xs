{@type:indicator}
// XQ 乖離率
//
input: Length1(5), Length2(10), Length3(20);

SetInputName(1, "天數一");
SetInputName(2, "天數二");
SetInputName(3, "天數三");

Plot1(Bias(Length1), "BIAS1(%)");
Plot2(Bias(Length2), "BIAS2(%)");
Plot3(Bias(Length3), "BIAS3(%)");

		