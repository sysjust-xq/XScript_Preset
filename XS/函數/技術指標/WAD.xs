{@type:function|@guid:c2794b1a8745431485c71e4e2584ea2a|@path:/技術指標/WAD}
SetBarMode(2);

{
XQ: WA/D 指標
}

variable: wadt(0), adt(0);

if CurrentBar = 1 then
	wadt = 0
else
  begin
	if close = close[1] then
		adt = 0
	else
	  begin
		if close < close[1] then
			adt = close - TrueHigh
		else
			adt = close - TrueLow;
	  end;

	wadt = adt + wadt[1];
  end;

WAD = wadt;

		