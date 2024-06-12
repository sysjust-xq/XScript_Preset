{@type:function}
SetBarMode(1);

// 跨頻率WeightedClose函數
//
// FreqType是預期要引用的頻率, 支援"D", "W", "M"
//
input:
	FreqType(string);

switch (upperstr(FreqType))
begin
	case "D":
		xf_WeightedClose = (2 * GetField("Close", "D") + GetField("High", "D") + GetField("Low", "D")) / 4;

	case "W":
		xf_WeightedClose = (2 * GetField("Close", "W") + GetField("High", "W") + GetField("Low", "W")) / 4;

	case "M":
		xf_WeightedClose = (2 * GetField("Close", "M") + GetField("High", "M") + GetField("Low", "M")) / 4;

	case "AD":
		xf_WeightedClose = (2 * GetField("Close", "AD") + GetField("High", "AD") + GetField("Low", "AD")) / 4;

	case "AW":
		xf_WeightedClose = (2 * GetField("Close", "AW") + GetField("High", "AW") + GetField("Low", "AW")) / 4;

	case "AM":
		xf_WeightedClose = (2 * GetField("Close", "AM") + GetField("High", "AM") + GetField("Low", "AM")) / 4;

	default:
		xf_WeightedClose = (2 * Close + High + Low) / 4;
end;
