{@type:indicator}
// XQ: 威廉指標
//
input: Length1(14), Length2(28), Length3(42);

SetInputName(1, "天數一");
SetInputName(2, "天數二");
SetInputName(3, "天數三");

value1 = PercentR(Length1) - 100;
value2 = PercentR(Length2) - 100;
value3 = PercentR(Length3) - 100;

Plot1(value1, "威廉指標1");
Plot2(value2, "威廉指標2");
Plot3(value3, "威廉指標3");
        
		