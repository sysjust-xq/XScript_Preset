{@type:function}
SetBarMode(2);

input:thePrice(numericseries); //"價格序列"
input:Length(Numeric);   //"計算期間"

variable:  Factor(0);

if length + 1 = 0 then Factor = 1 else Factor = 2 / (Length + 1);

if CurrentBar = 1 then
	EMA = thePrice
else if CurrentBar <= Length then
    EMA = (thePrice + (EMA[1]*(CurrentBar-1)))/CurrentBar	
else
	EMA = EMA[1] + Factor * (thePrice - EMA[1]);
 