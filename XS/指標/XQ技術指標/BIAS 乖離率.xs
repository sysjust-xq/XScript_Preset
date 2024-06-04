{@type:indicator|@guid:5dba5bc536ed43e6a8f882b38f1d4e2f|@path:/XQ技術指標/BIAS 乖離率|@hash:f518af543d99144fda4142a793e52a74}
// XQ 乖離率
//
input: Length1(5), Length2(10), Length3(20);

SetInputName(1, "天數一");
SetInputName(2, "天數二");
SetInputName(3, "天數三");

Plot1(Bias(Length1), "BIAS1(%)");
Plot2(Bias(Length2), "BIAS2(%)");
Plot3(Bias(Length3), "BIAS3(%)");

		