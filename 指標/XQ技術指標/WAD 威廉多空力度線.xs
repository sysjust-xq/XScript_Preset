{@type:indicator}
// XQ: WA/D 指標
//

variable: wad(0), _ad(0);

if CurrentBar = 1 then
	wad = 0
else
  begin	
	if close = close[1] then
		_ad = 0
	else	
	  begin
		if close < close[1] then
			_ad = close - TrueHigh
		else { close > close[1] }
			_ad = close - TrueLow;
	  end;

	wad = _ad + wad[1];
  end;
  
Plot1(wad, "WA/D");
		