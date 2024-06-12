{@type:function}
SetBarMode(2);

// 跨頻率Stochastic函數(for KD/RSV相關指標)
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType, SeriesH, SeriesL, SeriesC, Length, rsvt, kt
// 輸出: rsv_value, k_value, d_value
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string), 
	Length(numericsimple), rsvt(numericsimple), kt(numericsimple),
	rsv(numericref), k(numericref), d(numericref);
 
variable:
	maxHigh(0), minLow(0),lastK(50),lastD(50),closePeriod(0);

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");
 
if FreqType="D" or FreqType="AD" or FreqType="W" or FreqType="AW" or FreqType="M" or FreqType="AM" then 
	condition1 = xfMin_getdtvalue(FreqType, getfieldDate("Date")) <> xfMin_getdtvalue(FreqType, getfieldDate("Date")[1])
else 
	condition1 = xfMin_getdtvalue(FreqType, datetime) <> xfMin_getdtvalue(FreqType, datetime[1]);	
	
if condition1 then
begin
	lastK = k[1];
	lastD = d[1];
end;

switch (FreqType)
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
 
xfMin_Stochastic = 1;