{@type:sensor}
input:Length(20); setinputname(1,"調整型外盤均量計算期數");
input:Ratio(50); setinputname(2,"外盤量增幅度%");
input:TXT("僅適用60分鐘線"); setinputname(3,"使用限制");

settotalbar(3);
setbarback(Length);

if barfreq<> "Min" or barinterval <> 60 then return;

variable: AvgOutSideVol(0),DayOSV(0);

DayOSV = GetQuote("當日外盤量");
  
AvgOutSideVol =  averageIF( close > close[1] ,volume,Length);

switch(time)
begin
	case 90000: 
	    if C>O and DayOSV > AvgOutSideVol *(1+ Ratio/100) then ret=1;
	case 100000:
		if C>O and DayOSV/2 > AvgOutSideVol *(1+ Ratio/100) then ret=1;
	case 110000:
		if C>O and DayOSV/3 > AvgOutSideVol *(1+ Ratio/100) then ret=1;
	case 120000:
		if C>O and DayOSV/4 > AvgOutSideVol *(1+ Ratio/100) then ret=1;
end;