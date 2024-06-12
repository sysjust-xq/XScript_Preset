{@type:function}
SetBarMode(2);

// XQ: PVT指標
//

If CurrentBar = 1 then
	VPT = 0
else	
	VPT = VPT[1] + (close - close[1])/close[1] * Volume;

		