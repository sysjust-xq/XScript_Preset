{@type:filter}
input: v1(2000);	setinputname(1, "投信估計持股上限(張)");
input: v2(300);		setinputname(2, "近一日買賣超(張)");

value1=GetField("投信持股","D");
value2=GetField("投信買賣超","D");

if value1 < v1 and value2 > v2
then ret=1;

SetOutputName1("投信買賣超(張)");
OutputField1(value2);

