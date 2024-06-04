{@type:indicator|@guid:395edb13d5e146469b22486090b9a6ae|@path:/XQ技術指標/WAD 威廉多空力度線|@hash:6b0394a75b76af0f1eb408625a64d15d}
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
		