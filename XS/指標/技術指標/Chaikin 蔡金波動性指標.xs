{@type:indicator|@guid:f71041a64056467490b34a40a11baa2b|@path:/技術指標/Chaikin 蔡金波動性指標|@hash:a7e1b6ed38a3a61a2a65732dc61bf73d}
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

		