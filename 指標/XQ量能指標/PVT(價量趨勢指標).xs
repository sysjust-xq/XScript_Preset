{@type:indicator}
// XQ: PVT指標
//
variable: _pvt(0);

If CurrentBar = 1 then
	_pvt = 0
else	
	_pvt = _pvt[1] + (close - close[1])/close[1] * Volume;

Plot1(_pvt, "PVT");
		