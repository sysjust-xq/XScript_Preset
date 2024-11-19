{@type:function}
SetBarMode(1);

// 回傳某個日期的'normalized' value
// 用這個value來比對是否已經跨期
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// dtValue 是目前資料序列上面的Date
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string), 
	dtValue(numeric);

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

switch (FreqType)
begin
	case "1","5","10","15","30","60":
		// 回傳分鐘線的日期時間YYYYMMDDhhmmss。例如：2018/9/10 12:03:59的五分線會回傳20180910120000
		if symbolExchange="TF" then begin
			if dtValue < 19870106000000 then begin
				xfMin_GetDTValue = dtValue;
				return;
			end;
			value1 = strtonum(FreqType);
			value2 = strtonum(rightstr(numtostr(dtValue,0),6));
			if value2>=084500 and value2<150000 then value20=084500
			else if value2 >=150000 then value20=150000
			else value20=000000;
			value21= timediff(value2,value20,"M");
			value3 = IntPortion(value21 / value1) * value1;
			value31= timeadd(value20,"M",value3);
			xfMin_GetDTValue = dtValue - value2 + value31;
		end 
		else begin
			if dtValue < 19870106000000 then begin
				xfMin_GetDTValue = dtValue;
				return;
			end;
			value1 = strtonum(FreqType);
			value2 = strtonum(rightstr(numtostr(dtValue,0),6));
			value3 = IntPortion(minute(value2) / value1) * value1;
			xfMin_GetDTValue = dtValue - value2 + EncodeTime(hour(value2), value3, 0);	
		end;
		
	case "D" , "AD":
		// 回傳YYYYMMDD
		xfMin_GetDTValue = dtValue;
	  
	case "W" , "AW":
		// 年度 * 100 + 周別, e.g. 201001, 表示是2010年的第一週
		xfMin_GetDTValue = Year(dtValue) * 100 + WeekofYear(dtValue);
		
		// 每年的第一週需要判斷是否和去年的最後一週重疊 
		if WeekofYear(DateAdd(dtValue,"D", 1-DayofWeek(dtValue))) = 53 then 
			xfMin_GetDTValue = Year(DateAdd(dtValue,"D", 1-DayofWeek(dtValue))) * 100 + WeekofYear(DateAdd(dtValue,"D", 1-DayofWeek(dtValue)));
	 
	case "M" , "AM":
		// 年度 * 100 + 月別, e.g. 201001, 表示是2010年的第一個月
		xfMin_GetDTValue = Year(dtValue) * 100 + Month(dtValue);
	 
	default:
		xfMin_GetDTValue = dtValue;
end;