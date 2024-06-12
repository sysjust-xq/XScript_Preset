{@type:indicator}
// XQ: OBV指標
//
input:SMAlength(5,"OBV的短MA期數"), MMAlength(20,"OBV的中MA期數");
variable: obvolume(0), obvSMA(0), obvSMA_Str(""), obvMMA(0), obvMMA_Str("");

if CurrentBar = 1 then
	obvolume = 0
else
  begin	
	if close > close[1] then
		obvolume = obvolume[1] + volume
	else
	  begin
		if close < close[1] then
			obvolume = obvolume[1] - volume
		else
			obvolume = obvolume[1];
	  end;		
  end;

obvSMA = average(obvolume,SMAlength);
obvMMA = average(obvolume,MMAlength);

obvSMA_Str = text(numToStr(SMAlength,0),"MA");
obvMMA_Str = text(numToStr(MMAlength,0),"MA");
  
Plot1(obvolume,"OBV");
plot2(obvSMA,"SMA",checkbox:=1);
plot3(obvMMA,"MMA",checkbox:=1);
setplotLabel(2,obvSMA_Str);
setplotLabel(3,obvMMA_Str);
		