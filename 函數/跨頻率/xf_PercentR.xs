{@type:function}
SetBarMode(1);

// 跨頻率PercentR函數(for 威廉指標)
//
// FreqType是預期要引用的頻率, 支援"D", "W", "M"
// 輸入: FreqType, SeriesH, SeriesL, SeriesC, Length, rsvt, kt
// 輸出: rsv_value, k_value, d_value
//
input:
	FreqType(string), 
	Length(numericsimple);
 
variable:
	maxHigh(0), minLow(0),variableA(0),variableB(0),closePeriod(0);

switch (upperstr(FreqType))
begin
	case "D":
		maxHigh = highest(GetField("High", "D"),Length);
		minLow = lowest(GetField("Low", "D"),Length);
		closePeriod = GetField("Close", "D");

	case "W":
		maxHigh = highest(GetField("High", "W"),Length);
		minLow = lowest(GetField("Low", "W"),Length);
		closePeriod = GetField("Close", "W");

	case "M":
		maxHigh = highest(GetField("High", "M"),Length);
		minLow = lowest(GetField("Low", "M"),Length);
		closePeriod = GetField("Close", "M");

	case "AD":
		maxHigh = highest(GetField("High", "AD"),Length);
		minLow = lowest(GetField("Low", "AD"),Length);
		closePeriod = GetField("Close", "AD");

	case "AW":
		maxHigh = highest(GetField("High", "AW"),Length);
		minLow = lowest(GetField("Low", "AW"),Length);
		closePeriod = GetField("Close", "AW");

	case "AM":
		maxHigh = highest(GetField("High", "AM"),Length);
		minLow = lowest(GetField("Low", "AM"),Length);
		closePeriod = GetField("Close", "AM");

	default:
		maxHigh = highest(High,Length);
		minLow = lowest(Low,Length);
		closePeriod = Close;
end;

variableB = maxHigh - minLow;

if variableB <> 0 then  
	xf_PercentR = 100 - ((maxHigh - closePeriod) / variableB) * 100
else 
	xf_PercentR = 0;
