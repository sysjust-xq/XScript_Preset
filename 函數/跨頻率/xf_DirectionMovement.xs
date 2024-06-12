{@type:function}
SetBarMode(2);

// 跨頻率DirectionMovement function (for DMI相關指標)
//
// FreqType是預期要比對的期別, 支援"D", "W", "M"
// 輸入: FreqType, Length
// Return: pdi_value(+di), ndi_value(-di), adx_value(adx)
//
input: 
	FreqType(string),		//引用頻率
	length(numericsimple),	//計算期間
	pdi_value(numericref),	//回傳+DI
	ndi_value(numericref),	//回傳-DI
	adx_value(numericref);	//回傳ADX
	
variable:
	padm(0), nadm(0), radx(0),
	LastPAdm(0), LastNAdm(0), LastRAdx(0), LastATR(0),
	atr(0), pdm(0), ndm(0), tr(0),
	dValue0(0), dValue1(0), dx(0),
	changeHigh(0),changeLow(0),closePeriod(0),
	idx(0);

//跨頻率會用到的前期值需要手動記錄
condition1 = xf_getdtvalue(FreqType, getFieldDate("Date")) <> xf_getdtvalue(FreqType, getFieldDate("Date")[1]);
if condition1 then
begin
	LastPAdm = padm[1];
	LastNAdm = nadm[1];
	LastRAdx = radx[1];
	LastATR = atr[1];
end;

//取得跨頻率會用到的變數值
switch (FreqType)
begin
	case "D":
		if GetField("Close", "D")[1] > GetField("High", "D") then
			tr = GetField("Close", "D")[1] - GetField("Low", "D")
		else if GetField("Close", "D")[1] < GetField("Low", "D") then
			tr = GetField("High", "D") - GetField("Close", "D")[1]
		else
			tr = GetField("High", "D") - GetField("Low", "D");
		changeHigh = GetField("High", "D") - GetField("High", "D")[1];
		changeLow = GetField("Low", "D")[1] - GetField("Low", "D");
		closePeriod = GetField("Close", "D");

	case "W":
		if GetField("Close", "W")[1] > GetField("High", "W") then
			tr = GetField("Close", "W")[1] - GetField("Low", "W")
		else if GetField("Close", "W")[1] < GetField("Low", "W") then
			tr = GetField("High", "W") - GetField("Close", "W")[1]
		else
			tr = GetField("High", "W") - GetField("Low", "W");
		changeHigh = GetField("High", "W") - GetField("High", "W")[1];
		changeLow = GetField("Low", "W")[1] - GetField("Low", "W");
		closePeriod = GetField("Close", "W");

	case "M":
		if GetField("Close", "M")[1] > GetField("High", "M") then
			tr = GetField("Close", "M")[1] - GetField("Low", "M")
		else if GetField("Close", "M")[1] < GetField("Low", "M") then
			tr = GetField("High", "M") - GetField("Close", "M")[1]
		else
			tr = GetField("High", "M") - GetField("Low", "M");
		changeHigh = GetField("High", "M") - GetField("High", "M")[1];
		changeLow = GetField("Low", "M")[1] - GetField("Low", "M");
		closePeriod = GetField("Close", "M");

	case "AD":
		if GetField("Close", "AD")[1] > GetField("High", "AD") then
			tr = GetField("Close", "AD")[1] - GetField("Low", "AD")
		else if GetField("Close", "AD")[1] < GetField("Low", "AD") then
			tr = GetField("High", "AD") - GetField("Close", "AD")[1]
		else
			tr = GetField("High", "AD") - GetField("Low", "AD");
		changeHigh = GetField("High", "AD") - GetField("High", "AD")[1];
		changeLow = GetField("Low", "AD")[1] - GetField("Low", "AD");
		closePeriod = GetField("Close", "AD");

	case "AW":
		if GetField("Close", "AW")[1] > GetField("High", "AW") then
			tr = GetField("Close", "AW")[1] - GetField("Low", "AW")
		else if GetField("Close", "AW")[1] < GetField("Low", "AW") then
			tr = GetField("High", "AW") - GetField("Close", "AW")[1]
		else
			tr = GetField("High", "AW") - GetField("Low", "AW");
		changeHigh = GetField("High", "AW") - GetField("High", "AW")[1];
		changeLow = GetField("Low", "AW")[1] - GetField("Low", "AW");
		closePeriod = GetField("Close", "AW");

	case "AM":
		if GetField("Close", "AM")[1] > GetField("High", "AM") then
			tr = GetField("Close", "AM")[1] - GetField("Low", "AM")
		else if GetField("Close", "AM")[1] < GetField("Low", "AM") then
			tr = GetField("High", "AM") - GetField("Close", "AM")[1]
		else
			tr = GetField("High", "AM") - GetField("Low", "AM");
		changeHigh = GetField("High", "AM") - GetField("High", "AM")[1];
		changeLow = GetField("Low", "AM")[1] - GetField("Low", "AM");
		closePeriod = GetField("Close", "AM");

	default:
		if Close[1] > High then
			tr = Close[1] - Low
		else if Close[1] < Low then
			tr = High - Close[1]
		else
			tr = High - Low;
		changeHigh = High - High[1];
		changeLow = Low[1] - Low;
		closePeriod = Close;
end;

//原始的技術指標計算
value1 = xf_GetCurrentBar(FreqType);

if value1 = 1 then
 begin
	padm = closePeriod / 10000;
	nadm = padm;
	atr = padm * 5;
	radx = 20;
 end
else
 begin
	pdm = maxlist(changeHigh, 0);
	ndm = maxlist(changeLow, 0);

	if pdm < ndm then
		pdm = 0
	else 
	  begin
		if pdm > ndm then
			ndm = 0
		else
		  begin
			pdm = 0;
			ndm = 0;
		  end;		
	  end;
	
	padm = LastPAdm + (pdm - LastPAdm) / length;
	nadm = LastNAdm + (ndm - LastNAdm) / length;
	atr = LastATR + (tr - LastATR) / length;
	
	if atr <> 0 then begin
		dValue0 = 100 * padm / atr;
		dValue1 = 100 * nadm / atr;
	end;
	
	if dValue0 + dValue1 <> 0 then
		dx = AbsValue(100 * (dValue0 - dValue1) / (dValue0 + dValue1));

	radx = LastRAdx + (dx - LastRAdx) / length;
 end;

pdi_value = dValue0;
ndi_value = dValue1;
adx_value = radx;
xf_directionmovement = 1;

