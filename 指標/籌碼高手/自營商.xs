{@type:indicator}
input: _input1(1,"自營商",inputkind:= Dict(["全部",1],["自行買賣",2],["避險",3]),quickedit:=true);

condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

if condition999 = false and condition994 = false//大盤, 個股, 權證, 興櫃, 類股指數
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if condition994 then begin
	switch (_input1)
	begin
		case 2:
			value1 = GetField("自營商自行買賣買進金額");
			value2 = GetField("自營商自行買賣賣出金額");
			value3 = GetField("自營商自行買賣買賣超金額");
			value4 = value4 + GetField("自營商自行買賣買賣超金額");
		case 3:
			value1 = GetField("自營商避險買進金額");
			value2 = GetField("自營商避險賣出金額");
			value3 = GetField("自營商避險買賣超金額");
			value4 = value4 + GetField("自營商避險買賣超金額");
		default:
			value1 = GetField("自營商買進金額");
			value2 = GetField("自營商賣出金額");
			value3 = GetField("自營商買賣超金額");
			value4 = value4 + GetField("自營商買賣超金額");
	end;
	plot2(value4,"自營商累計買賣超",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis1
	setplotlabel(1,"買賣超(元)");
	setplotlabel(2,"自營商累計買賣超(元)");
	setplotlabel(3,"買進(元)");
	setplotlabel(4,"賣出(元)");
	plot1(value3,"買賣超",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //bar，axis2
	plot3(value1,"買進",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
	plot4(value2,"賣出",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
end else begin
	switch (_input1)
	begin
		case 2:
			if symbolexchange <> "TE" and condition993 = false and date >= 20110106 then begin
				value1 = GetField("自營商自行買賣買張");
				value2 = GetField("自營商自行買賣賣張");
			end;
			value3 = GetField("自營商自行買賣買賣超");
		case 3:
			if symbolexchange <> "TE" and condition993 = false and date >= 20110106 then begin
				value1 = GetField("自營商避險買張");
				value2 = GetField("自營商避險賣張");
			end;
			value3 = GetField("自營商避險買賣超");
		default:
			if symbolexchange <> "TE" and condition993 = false and date >= 20110106 then begin
				value1 = GetField("自營商買張");
				value2 = GetField("自營商賣張");
			end;
			value3 = GetField("自營商買賣超張數");
	end;
	plot2(GetField("自營商持股"),"自營商持股",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis1
	setplotlabel(1,"買賣超(張)");
	setplotlabel(2,"自營商持股(張)");
	setplotlabel(3,"買進(張)");
	setplotlabel(4,"賣出(張)");
	if condition993 = false then begin
		plot5(0.01*GetField("自營商持股比例"),"自營商持股比例",axis:=12,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
	end;
	plot1(value3,"買賣超",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0); //bar，axis2
	if symbolexchange <> "TE" and condition993 = false then begin
		plot3(value1,"買進",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis2
		plot4(value2,"賣出",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis2
	end;
end;