{@type:filter|@guid:c43728b5be96414f846339d35206ee48|@path:/11.選股機器人/投信掃貨}
input: pastDays(5, "計算天數");
input: _BuyRatio(10, "買超佔比例(%)");

variable: SumForce(0);
variable: SumTotalVolume(0);

SumForce = Summation(GetField("投信買賣超"), pastDays);
sumTotalVolume = Summation(Volume, pastDays);
value1 = SumForce / SumTotalVolume * 100;
if value1 > _BuyRatio then ret =1;

outputfield(1,value1,2,"投信買超%", order := 1);
