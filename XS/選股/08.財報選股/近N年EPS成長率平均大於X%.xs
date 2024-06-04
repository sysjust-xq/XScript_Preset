{@type:filter|@guid:dfbbd6c2a6be4c47b21c7dd24498cb4b|@path:/08.財報選股/近N年EPS成長率平均大於X%}
input: N(5), X(10);
setbarfreq("Y");

setinputname(1, "期別");
setinputname(2, "平均EPS成長率(%)");

SetTotalBar(N+3);

Value1 = Average(RateOfChange(GetField("每股稅後淨利(元)","Y"), 1), N);

Ret = Value1 > X;

SetOutputName1("平均EPS成長率(%)");
OutputField1(Value1);


