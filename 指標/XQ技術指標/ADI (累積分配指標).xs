{@type:indicator}
// XQ: A/DI 指標
//
variable: adi(0);

if Close > Close[1] then
	adi = adi[1] + (Close - minlist(low, close[1])) 
else
  begin
	if Close < Close[1] then
		adi = adi[1] - (maxlist(high, close[1]) - close)
	else
		adi = adi[1];
  end;

Plot1(adi, "A/DI");
		