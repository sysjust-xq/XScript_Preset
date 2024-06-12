{@type:function}
SetBarMode(2);

// DirectionMovement function (for DMI相關指標)
//	Input: length
//	Return: pdi_value(+di), ndi_value(-di), adx_value(adx)
//
input: 
	length(numericsimple),
	pdi_value(numericref),
	ndi_value(numericref),
	adx_value(numericref);
	
variable:
	padm(0), nadm(0), radx(0),
	atr(0), pdm(0), ndm(0), tr(0),
	dValue0(0), dValue1(0), dx(0),
	idx(0);

if currentbar = 1 then
 begin
	padm = close / 10000;
	nadm = padm;
	atr = padm * 5;
	radx = 20;
 end
else
 begin
	pdm = maxlist(High - High[1], 0);
	ndm = maxlist(Low[1] - Low, 0);

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

	if Close[1] > High then
		tr = Close[1] - Low
	else	
	  begin
		if Close[1] < Low then
			tr = High - Close[1]
		else	
			tr = High - Low;
	  end;

	padm = padm[1] + (pdm - padm[1]) / length;
	nadm = nadm[1] + (ndm - nadm[1]) / length;
	atr = atr[1] + (tr - atr[1]) / length;
	
	if atr <> 0 then begin
		dValue0 = 100 * padm / atr;
		dValue1 = 100 * nadm / atr;
	end;
	
	if dValue0 + dValue1 <> 0 then
		dx = AbsValue(100 * (dValue0 - dValue1) / (dValue0 + dValue1));

	radx = radx[1] + (dx - radx[1]) / length;
 end;

pdi_value = dValue0;
ndi_value = dValue1;
adx_value = radx;

