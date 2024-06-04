{@type:indicator|@guid:c8a4cbe3dd1b4610a542cb686fd092c6|@path:/XQ量能指標/NVI(負量指標)|@hash:fbb452eb5b9328c3c31f6c131bdaa881}
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

		