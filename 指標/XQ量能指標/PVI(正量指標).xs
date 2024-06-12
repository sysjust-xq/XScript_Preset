{@type:indicator}
// XQ: PVI指標
//
Variable: _pvi(1);

If CurrentBar = 1 then
	_pvi = 1
else
  begin	
	if Volume > Volume[1] then
		_pvi = _pvi[1] + (Close - Close[1]) / Close[1]
	else
		_pvi = _pvi[1];
  end;
  
Plot1(_pvi, "PVI");
		