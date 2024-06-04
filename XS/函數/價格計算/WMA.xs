{@type:function|@guid:966999ee1cff467f9ff0315ccb773eff|@path:/價格計算/WMA}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(Numeric);   //"計算期間"

variable:  Factor(0);

if Factor = 0 then Factor = 0.5 * Length * (Length+1);

if CurrentBar < Length then
	WMA = thePrice
else begin
	WMA = Length * thePrice;
	for value1 = 1 to Length - 1
		WMA += thePrice[value1] * (Length - value1);	
    WMA = WMA/Factor;
end;
