{@type:function}
SetBarMode(2);

input:  
	FreqType(numericsimple), 	//指定K棒頻率，1:日線、2:週線、3:月線、3.25:季、3.5 半年、4:年線
	FreqAgo(numericsimple), 	//指定K棒位置
	refFreqOpen(numericref), 	//輸出K棒開盤價
	refFreqHigh(numericref),	//輸出K棒最高價
	refFreqLow(numericref), 	//輸出K棒最低價
	refFreqClose(numericref);	//輸出K棒收盤價
variable:
	varBarFreqInt(-1),
	varBarIndex(-1);
array:
	arrayO[200](-1),
	arrayH[200](-1),
	arrayL[200](-1),
	arrayC[200](-1);

switch (barfreq)
begin
	case "Tick":
		varBarFreqInt = 0;
	case "Min","Hour":
		varBarFreqInt = 1;
	case "D","AD":
		varBarFreqInt = 2;
	case "W","AW":
		varBarFreqInt = 3;
	case "M","AM","Q","H","Y":
		varBarFreqInt = 4;
	default:
		varBarFreqInt = -1;
end;

if  FreqAgo > 200 or FreqAgo < 0 or varBarFreqInt = -1 or varBarFreqInt > FreqType + 1 then return;

switch (FreqType)
begin
	case 2:
		condition1 = WeekofYear(Date) <> WeekofYear(Date[1]) ;
		if WeekofYear(Date[1]) =53 and  DayofWeek(Date)> DayofWeek(Date[1]) then condition1= false;
  	case 3:
		condition1 = Month(Date) <> Month(Date[1]);
	case 3.25:
	    condition1 = Mod(Month(Date),3)=1 and Mod(Month(Date[1]),3)=0 ;
	case 3.5:
	    condition1 = Mod(Month(Date),6)=1 and Mod(Month(Date[1]),6)=0 ;
	case 4:
		condition1 = Year(Date) <> Year(Date[1]);
	default:
		condition1 = Date <> Date[1];
end;

condition1 = CurrentBar = 1 or condition1;
if condition1 then
begin
	varBarIndex = varBarIndex - 1;
	if varBarIndex < 0 then varBarIndex = FreqAgo;	
	arrayO[varBarIndex] = Open;
	arrayH[varBarIndex] = High;
	arrayL[varBarIndex] = Low;
	arrayC[varBarIndex] = Close;
end
else
begin
	arrayC[varBarIndex] = Close;
	if High > arrayH[varBarIndex] then
		arrayH[varBarIndex] = High;
	if Low < arrayL[varBarIndex] then
		arrayL[varBarIndex] = Low;
end;

refFreqOpen = arrayO[Mod( varBarIndex + FreqAgo, FreqAgo + 1) ];
refFreqHigh = arrayH[Mod( varBarIndex + FreqAgo, FreqAgo + 1) ];
refFreqLow = arrayL[Mod( varBarIndex + FreqAgo, FreqAgo + 1) ];
refFreqClose = arrayC[Mod( varBarIndex + FreqAgo, FreqAgo + 1) ];
OHLCPeriodsAgo = 1;
 

        