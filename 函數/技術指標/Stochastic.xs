{@type:function}
SetBarMode(2);

// Stochastic function (for KD/RSV相關指標)
//
// Input: length, rsvt, kt
// Return: rsv_value, k_value, d_value
//
input:
	length(numericsimple), rsvt(numericsimple), kt(numericsimple),
	rsv(numericref), k(numericref), d(numericref);

variable:
	maxHigh(0), minLow(0);

maxHigh = Highest(high, length);
minLow = Lowest(low, length);

if maxHigh <> minLow then
	rsv = 100 * (close - minLow) / (maxHigh - minLow)
else
	rsv = 50;

if currentbar = 1 then
  begin
	k = 50;
	d = 50;
  end
else
  begin
	k = (k[1] * (rsvt - 1) + rsv) / rsvt;
	d = (d[1] * (kt - 1) + k) / kt;
  end;  

stochastic = 1;