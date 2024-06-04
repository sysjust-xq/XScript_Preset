{@type:function|@guid:57f222578a2c4d17b2b88b65b8f28696|@path:/跨頻率/xf_GetDTValue|@hash:bb7bdf06635ff865ab2ca4544bfbda03}
SetBarMode(1);

// 回傳某個日期的'normalized' value
// 用這個value來比對是否已經跨期
//
// FreqType是預期要比對的期別, 支援"D", "W", "M"
// dtValue 是目前資料序列上面的Date
//
input:
	FreqType(string), 
	dtValue(numeric);
 
switch (FreqType)
begin
	case "D" , "AD":
		xf_GetDTValue = dtValue;
	  
	case "W" , "AW":
		// 年度 * 100 + 周別, e.g. 201001, 表示是2010年的第一週
		// 
		xf_GetDTValue = Year(dtValue) * 100 + WeekofYear(dtValue);
		
		// 每年的第一週需要判斷是否和去年的最後一週重疊
		// 
		if WeekofYear(DateAdd(dtValue,"D", 1-DayofWeek(dtValue))) = 53 then 
			xf_GetDTValue = Year(DateAdd(dtValue,"D", 1-DayofWeek(dtValue))) * 100 + WeekofYear(DateAdd(dtValue,"D", 1-DayofWeek(dtValue)));
	 
	case "M" , "AM":
		// 年度 * 100 + 月別, e.g. 201001, 表示是2010年的第一個月
		//
		xf_GetDTValue = Year(dtValue) * 100 + Month(dtValue);
	 
	default:
		xf_GetDTValue = dtValue;
end;