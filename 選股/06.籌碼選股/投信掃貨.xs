{@type:filter}
input: pastDays(5); 		setinputname(1,"計算天數");
input: _BuyRatio(10); 		setinputname(2,"買超佔比例(%)");

variable: SumForce(0);
variable: SumTotalVolume(0);

SetTotalBar(3);

SumForce = Summation(GetField("投信買賣超"), pastDays);
sumTotalVolume = Summation(Volume, pastDays);
value1 = SumForce / SumTotalVolume * 100;
if value1 > _BuyRatio then ret =1;

SetOutputName1("買超佔比例(%)");
OutputField1(value1);


