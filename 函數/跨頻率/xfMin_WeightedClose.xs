{@type:function}
SetBarMode(1);

// 跨頻率WeightedClose函數
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string);

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

switch (UpperStr(FreqType))
begin
	case  "1":
		xfMin_WeightedClose = (2 * GetField("Close", "1") + GetField("High", "1") + GetField("Low", "1")) / 4;
		
	case  "5":
		xfMin_WeightedClose = (2 * GetField("Close", "5") + GetField("High", "5") + GetField("Low", "5")) / 4;	
	
	case "10":
		xfMin_WeightedClose = (2 * GetField("Close", "10") + GetField("High", "10") + GetField("Low", "10")) / 4;	
	
	case "15":
		xfMin_WeightedClose = (2 * GetField("Close", "15") + GetField("High", "15") + GetField("Low", "15")) / 4;	
	
	case "30":
		xfMin_WeightedClose = (2 * GetField("Close", "30") + GetField("High", "30") + GetField("Low", "30")) / 4;	
	
	case "60":
		xfMin_WeightedClose = (2 * GetField("Close", "60") + GetField("High", "60") + GetField("Low", "60")) / 4;

	case "D":
		xfMin_WeightedClose = (2 * GetField("Close", "D") + GetField("High", "D") + GetField("Low", "D")) / 4;

	case "W":
		xfMin_WeightedClose = (2 * GetField("Close", "W") + GetField("High", "W") + GetField("Low", "W")) / 4;

	case "M":
		xfMin_WeightedClose = (2 * GetField("Close", "M") + GetField("High", "M") + GetField("Low", "M")) / 4;

	case "AD":
		xfMin_WeightedClose = (2 * GetField("Close", "AD") + GetField("High", "AD") + GetField("Low", "AD")) / 4;

	case "AW":
		xfMin_WeightedClose = (2 * GetField("Close", "AW") + GetField("High", "AW") + GetField("Low", "AW")) / 4;

	case "AM":
		xfMin_WeightedClose = (2 * GetField("Close", "AM") + GetField("High", "AM") + GetField("Low", "AM")) / 4;

	default:
		xfMin_WeightedClose = (2 * Close + High + Low) / 4;
end;
