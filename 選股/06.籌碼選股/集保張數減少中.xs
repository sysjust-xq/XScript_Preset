{@type:filter}
input: n(3);			setinputname(1, "計算期間(週)");
input: Amount(1000);	setinputname(2, "減少張數(張)");

SetTotalBar(3);

// 單位=萬張
Value1 = (GetField("集保張數","W")[n] - GetField("集保張數","W")) * 10000;
if Value1 > Amount then
ret = 1;

setoutputname1("減少張數(張)");
OutputField1(Value1);

 