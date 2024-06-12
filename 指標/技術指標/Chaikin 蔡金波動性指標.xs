{@type:indicator}
// Chaikin Volatility 指標
//
input: Length(10), LengthROC(12);
variable: _chaikin(0);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Value1 = XAverage(High - Low, Length);

if CurrentBar >= LengthROC And Value1[LengthROC] <> 0 then
	_chaikin = 100 * (Value1 - Value1[LengthROC]) / Value1[LengthROC]
else
	_chaikin = 0;
	
Plot1(_chaikin, "Chaikin");

		