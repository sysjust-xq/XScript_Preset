{@type:filter}
input:r1(60);	setinputname(1,"投信外資及董監合計持股比例下限(%)");

SetTotalBar(3);

value1=GetField("投信持股比例","D");
value2=GetField("外資持股比例","D");
value3=GetField("董監持股佔股本比例","D");
value4=value1+value2+value3;

if value4 > r1
then ret=1;

