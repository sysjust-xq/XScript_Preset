{@type:filter}
input: N(5), X(10);
setbarfreq("Y");

setinputname(1, "期別");
setinputname(2, "平均EPS成長率(%)");

SetTotalBar(N+3);

Value1 = Average(RateOfChange(GetField("每股稅後淨利(元)","Y"), 1), N);

Ret = Value1 > X;

SetOutputName1("平均EPS成長率(%)");
OutputField1(Value1);


