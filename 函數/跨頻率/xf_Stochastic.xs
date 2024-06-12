{@type:function}
SetBarMode(2);

// 跨頻率Stochastic函數(for KD/RSV相關指標)
//
// FreqType是預期要引用的頻率, 支援"D", "W", "M"
// 輸入: FreqType, SeriesH, SeriesL, SeriesC, Length, rsvt, kt
// 輸出: rsv_value, k_value, d_value
//
input:
	FreqType(string), 
	Length(numericsimple), rsvt(numericsimple), kt(numericsimple),
	rsv(numericref), k(numericref), d(numericref);
 
variable:
	maxHigh(0), minLow(0),lastK(50),lastD(50),closePeriod(0);
 
condition1 = xf_getdtvalue(FreqType, getFieldDate("Date")) <> xf_getdtvalue(FreqType, getFieldDate("Date")[1]);
if condition1 then
begin
	lastK = k[1];
	lastD = d[1];
end;

switch (FreqType)
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

if maxHigh <> minLow then
	rsv = 100 * (closePeriod - minLow) / (maxHigh - minLow)
else
	rsv = 50;
 
if currentbar = 1 then
begin
	k = 50;
	d = 50;
end
else
begin
	k = (lastK * (rsvt - 1) + rsv) / rsvt;
	d = (lastD * (kt - 1) + k) / kt;
end; 
 
xf_Stochastic = 1;