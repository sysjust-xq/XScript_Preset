{@type:function}
SetBarMode(2);

// SAR function (for SAR指標)
//
Input: AFInitial(numericsimple);
Input: AFIncrement(numericsimple);
Input: AFMax(numericsimple);

variable:
	presar(0), ep(0), upTrend(false), af(0);
	
if CurrentBar = 1 then
  begin
	if Close > Close[1] then	// 上漲
	  begin
		upTrend = true;
		sar = Low[1];
		ep = High[1];
	  end	
	else						// 下跌
	  begin
		upTrend = false;
		sar = High[1];
		ep = Low[1];
	  end;	

	af = AFInitial;
	presar = sar;
  end
else
  begin  
	sar = presar + af * (ep - presar);
	presar = sar;
	if upTrend = true then
	  begin
		if High > ep then		// 繼續破high
		  begin
			ep = High;
			af = minlist(af + AFIncrement, AFMax);
		  end;
		
		if sar >= Low then		// 反轉
		  begin
			presar = ep;
			ep = Low;
			af = AFInitial;
			sar = presar;
			upTrend = false;
		  end;	
	  end
	else
	  begin
		if Low < ep then		// 繼續破low
		  begin
			ep = Low;
			af = minlist(af + AFIncrement, AFMax);
		  end;

		if sar <= High then		// 反轉
		  begin
			presar = ep;
			ep = High;
			af = AFInitial;
			sar = presar;
			upTrend = true;
		  end;	
	  end;
  end;