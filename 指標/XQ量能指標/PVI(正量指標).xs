{@type:indicator|@guid:f905ecfe67bf42b88d3bcc5e822e0b81|@path:/XQ量能指標/PVI(正量指標)|@hash:ad3b560e57bb16e13e9035a63150d803}
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
		