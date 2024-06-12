{@type:indicator}
{ 
James Sibbet's Demand Index Indicator 
The Demand Index combines price and volume in 
such a way that it is often a leading indicator of 
price change. 
} 

input: Length (10,"期數"); 

variable : 
	WtCRatio(1), VolRatio(1), VolAvg(Volume), 
	bu(1), sel(1), Sign1(+1), 
	WghtClose(Close), AvgTR(High - Low), 
	Constant(1), bures(1), selres(1), 
	TempDI(1), DMI(1); 

If CurrentBar = 1 then 
	VolAvg = Average(Volume, Length); 

WghtClose = (High + Low + Close + Close) * 0.25; 
AvgTR = Average (Highest (High, 2) - Lowest ( Low, 2), Length); 
VolAvg = ((VolAvg [1] * (Length - 1)) + Volume) / Length; 

If WghtClose <> 0 and WghtClose[1] <> 0 and 
	AvgTR <> 0 and VolAvg <> 0 then Begin 
	WtCRatio = (WghtClose - WghtClose[1]) / MinList(WghtClose,WghtClose[1]) ; 
	VolRatio = Volume / VolAvg; 
	Constant = ((WghtClose * 3) /AvgTR) * AbsValue (WtCRatio); 
	If Constant > 88 then Constant = 88; 
	Constant = VolRatio / ExpValue (Constant); 
	If WtCRatio > 0 then Begin 
		bu = VolRatio; 
		sel = Constant; 
	End Else Begin 
		bu = Constant; 
		sel = VolRatio; 
	End; 

	bures = ((bures [1] * (Length - 1)) + bu) / Length; 
	selres = ((selres [1] * (Length - 1)) + sel) / Length; 

	TempDI = +1; 

	If selres > bures then Begin 
		Sign1 = -1; 
		If selres <> 0 then TempDI = bures / selres; 
	End Else Begin 
		Sign1 = +1; 
		If bures <> 0 then TempDI = selres / bures; 
	End; 

	TempDI = TempDI * Sign1; 
	If TempDI < 0 then 
		DMI = -1 - TempDI 
	else 
		DMI = +1 - TempDI ; 
End;

Plot1(dmi);
