{@type:filter}
Input: X(10); SetInputName(1, "本益比(倍)");

settotalbar(3);

Value1 = GetField("本益比", "D");
if Value1 < X then Ret = 1;

SetOutputName1("本益比(倍)");
outputfield1(Value1);


