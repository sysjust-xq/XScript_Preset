{@type:function}
SetBarMode(2);

{
對收盤價的運動量指標取再次平均價
Length: 計算期數
}
input: Length(numeric);

value1 = Momentum(Close, Length);
if CurrentBar >= Length then
	Value2 = Average(Value1, Length)
else
	Value2 = Value1;

mtm_ma = value2;

		