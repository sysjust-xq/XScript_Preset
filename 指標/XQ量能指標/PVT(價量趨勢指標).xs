{@type:indicator|@guid:0032169593b14e6e94601badc14cdb0a|@path:/XQ量能指標/PVT(價量趨勢指標)|@hash:ffd7423211c7d7d5edd57f602503f2b1}
// XQ: PVT指標
//
variable: _pvt(0);

If CurrentBar = 1 then
	_pvt = 0
else	
	_pvt = _pvt[1] + (close - close[1])/close[1] * Volume;

Plot1(_pvt, "PVT");
		