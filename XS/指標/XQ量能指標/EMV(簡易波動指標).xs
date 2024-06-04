{@type:indicator|@guid:2574edb4682b4c45a099c9b0575fef3f|@path:/XQ量能指標/EMV(簡易波動指標)|@hash:ec8f4d602fcd5d219dc9faf8f5905d31}
// XQ: EMV指標
//
Input: Length(14);
variable: _emv(0), factor(10000), avg(0);

SetInputName(1, "天數");

if Volume = 0 then
	_emv = 0
else
	_emv = factor * (((High + Low) / 2 - (High[1] + Low[1]) / 2) * (High - Low)) / Volume;

Plot1(_emv, "EMV");


If CurrentBar >= Length Then
	avg = Average(_emv, Length)
else
	avg = _emv;	

Plot2(avg, "EMVA");
 

		