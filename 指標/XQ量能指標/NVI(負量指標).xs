{@type:indicator}
// XQ: NVI指標
//
Variable: _nvi(1);

if CurrentBar = 1 then
	_nvi = 1
else
  begin	
	if Volume < Volume[1] then
		_nvi = _nvi[1] + (Close - Close[1]) / Close[1]
	else
		_nvi = _nvi[1];
  end;
  
Plot1(_nvi, "NVI");

		