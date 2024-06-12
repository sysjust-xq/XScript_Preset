{@type:indicator}
// XQ: MACD指標
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: price(0);

SetInputName(1, "DIF短天數");
SetInputName(2, "DIF長天數");
SetInputName(3, "MACD天數");

price = WeightedClose();

Value1 = XAverage(price, FastLength) - XAverage(price, SlowLength);
Value2 = XAverage(Value1, MACDLength) ;
Value3 = Value1 - Value2 ;

// 前面區段資料變動較大, 先不繪出
//
if CurrentBar <= SlowLength then
begin
	Value1 = 0;
	Value2 = 0;
	Value3 = 0;
end;

Plot1(Value1, "DIF");
Plot2(Value2, "MACD");
Plot3(Value3, "Osc");
		