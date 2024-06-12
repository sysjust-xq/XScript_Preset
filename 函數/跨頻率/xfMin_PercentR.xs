{@type:function}
SetBarMode(1);

// 跨頻率PercentR函數(for 威廉指標)
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType, SeriesH, SeriesL, SeriesC, Length, rsvt, kt
// 輸出: rsv_value, k_value, d_value
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string), 
	Length(numericsimple);
 
variable:
	maxHigh(0), minLow(0),variableA(0),variableB(0),closePeriod(0);

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

switch (upperstr(FreqType))
begin
	case  "1":
		maxHigh = simplehighest(GetField("High", "1"),Length);
		minLow = simplelowest(GetField("Low", "1"),Length);
		closePeriod = GetField("Close", "1");	

	case  "5":
		maxHigh = simplehighest(GetField("High", "5"),Length);
		minLow = simplelowest(GetField("Low", "5"),Length);
		closePeriod = GetField("Close", "5");
		
	case "10":
		maxHigh = simplehighest(GetField("High", "10"),Length);
		minLow = simplelowest(GetField("Low", "10"),Length);
		closePeriod = GetField("Close", "10");
	
	case "15":
		maxHigh = simplehighest(GetField("High", "15"),Length);
		minLow = simplelowest(GetField("Low", "15"),Length);
		closePeriod = GetField("Close", "15");
	
	case "30":
		maxHigh = simplehighest(GetField("High", "30"),Length);
		minLow = simplelowest(GetField("Low", "30"),Length);
		closePeriod = GetField("Close", "30");
	
	case "60":
		maxHigh = simplehighest(GetField("High", "60"),Length);
		minLow = simplelowest(GetField("Low", "60"),Length);
		closePeriod = GetField("Close", "60");

	case "D":
		maxHigh = simplehighest(GetField("High", "D"),Length);
		minLow = simplelowest(GetField("Low", "D"),Length);
		closePeriod = GetField("Close", "D");

	case "W":
		maxHigh = simplehighest(GetField("High", "W"),Length);
		minLow = simplelowest(GetField("Low", "W"),Length);
		closePeriod = GetField("Close", "W");

	case "M":
		maxHigh = simplehighest(GetField("High", "M"),Length);
		minLow = simplelowest(GetField("Low", "M"),Length);
		closePeriod = GetField("Close", "M");

	case "AD":
		maxHigh = simplehighest(GetField("High", "AD"),Length);
		minLow = simplelowest(GetField("Low", "AD"),Length);
		closePeriod = GetField("Close", "AD");

	case "AW":
		maxHigh = simplehighest(GetField("High", "AW"),Length);
		minLow = simplelowest(GetField("Low", "AW"),Length);
		closePeriod = GetField("Close", "AW");

	case "AM":
		maxHigh = simplehighest(GetField("High", "AM"),Length);
		minLow = simplelowest(GetField("Low", "AM"),Length);
		closePeriod = GetField("Close", "AM");

	default:
		maxHigh = simplehighest(High,Length);
		minLow = simplelowest(Low,Length);
		closePeriod = Close;
end;

variableB = maxHigh - minLow;

if variableB <> 0 then  
	xfMin_PercentR = 100 - ((maxHigh - closePeriod) / variableB) * 100
else 
	xfMin_PercentR = 0;
