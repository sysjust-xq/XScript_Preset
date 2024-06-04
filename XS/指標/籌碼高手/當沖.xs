{@type:indicator|@guid:5f9aaaf53a104cd4883c344c74e4e6fc|@path:/籌碼高手/當沖|@hash:eb3bb79fd4dd2d3e46f9da0ec387347e}
input: _input1(1,"計算方式",inputkind:= Dict(["全部",1],["資券互抵",2],["現股當沖",3]),quickedit:=true);//1=全部（預設）、2=資券互抵、3=現股當沖

variable: dtVolume(0);

condition996 = symbolexchange = "TW" and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

if condition994 =false and condition993 = false and condition996 = false //大盤+類股+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

switch (_input1)
begin
	case 2:
		dtVolume = GetField("資券互抵張數");

	case 3:
		dtVolume = GetField("現股當沖張數");

	default:
		dtVolume = GetField("資券互抵張數") + GetField("現股當沖張數");
end;

if condition993 and not condition994 then
	begin
		switch (barfreq)
		begin
			case "W","AW":
				value1 = summation(GetField("內盤量","D") + GetField("外盤量","D"),dayofweek(getfielddate("內盤量","D")));
			case "M","AM":
				value1 = summation(GetField("內盤量","D") + GetField("外盤量","D"),ceiling(dayofmonth(getfielddate("內盤量","D"))*5/7));
			case "Q":
				value1 = summation(GetField("內盤量","D") + GetField("外盤量","D"),mod(month(getfielddate("內盤量","D"))+2,3)*22 + ceiling(dayofmonth(getfielddate("內盤量","D"))*5/7));
			case "H":
				value1 = summation(GetField("內盤量","D") + GetField("外盤量","D"),mod(month(getfielddate("內盤量","D"))+5,6)*22 + dayofmonth(getfielddate("內盤量","D"))*5/7);
			case "Y":
				value1 = summation(GetField("內盤量","D") + GetField("外盤量","D"),mod(month(getfielddate("內盤量","D"))+11,12)*22 + dayofmonth(getfielddate("內盤量","D"))*5/7);
			default:
				value1 = GetField("內盤量","D") + GetField("外盤量","D");
		end;
	end
else if condition994 then
	begin
		switch (barfreq)
		begin
			case "W","AW":
				value1 = summation(GetField("累計成交","D"),dayofweek(getfielddate("累計成交","D")));
			case "M","AM":
				value1 = summation(GetField("累計成交","D"),ceiling(dayofmonth(getfielddate("累計成交","D"))*5/7));
			case "Q":
				value1 = summation(GetField("累計成交","D"),mod(month(getfielddate("累計成交","D"))+2,3)*22 + ceiling(dayofmonth(getfielddate("累計成交","D"))*5/7));
			case "H":
				value1 = summation(GetField("累計成交","D"),mod(month(getfielddate("累計成交","D"))+5,6)*22 + ceiling(dayofmonth(getfielddate("累計成交","D"))*5/7));
			case "Y":
				value1 = summation(GetField("累計成交","D"),mod(month(getfielddate("累計成交","D"))+11,12)*22 + ceiling(dayofmonth(getfielddate("累計成交","D"))*5/7));
			default:
				value1 = GetField("累計成交","D");
		end;
	end
else 
	value1 = volume;

if value1 <> 0 then
	value2 = dtVolume/value1
else
	value2 = 0;


if symboltype = 1 then begin
	plot1(dtVolume,"當沖張數",axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);	//單位：張
	plot2(value2,"當沖率",axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
	plot3(GetField("資券互抵張數"),"資券互抵(張)",ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
	plot4(GetField("現股當沖張數"),"現股當沖(張)",ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
end else begin
	plot1(dtVolume,"當沖張數",axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);	//單位：張
	plot2(value2,"當沖率",axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
	plot3(GetField("資券互抵張數"),"資券互抵(張)",ScaleLabel:=slfull,ScaleDecimal:=sd0);
	plot4(GetField("現股當沖張數"),"現股當沖(張)",ScaleLabel:=slfull,ScaleDecimal:=sd0);
end;