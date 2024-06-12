{@type:function}
SetBarMode(1);

// 跨頻率MTM函數(for MTM指標)
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType, Series, Length
//
input:
	FreqType(string),		//引用頻率
	Length(numericsimple);	//計算期間
	
if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");
 
switch (FreqType)
begin
	case  "1":
		xfMin_MTM = GetField("收盤價", "1") - GetField("收盤價", "1")[length];
	
	case  "5":
		xfMin_MTM = GetField("收盤價", "5") - GetField("收盤價", "5")[length];
	
	case "10":
		xfMin_MTM = GetField("收盤價", "10") - GetField("收盤價", "10")[length];
	
	case "15":
		xfMin_MTM = GetField("收盤價", "15") - GetField("收盤價", "15")[length];
	
	case "30":
		xfMin_MTM = GetField("收盤價", "30") - GetField("收盤價", "30")[length];
	
	case "60":
		xfMin_MTM = GetField("收盤價", "60") - GetField("收盤價", "60")[length];

	case "D":
		xfMin_MTM = GetField("收盤價", "D") - GetField("收盤價", "D")[length];

	case "W":
		xfMin_MTM = GetField("收盤價", "W") - GetField("收盤價", "W")[length];

	case "M":
		xfMin_MTM = GetField("收盤價", "M") - GetField("收盤價", "M")[length];

	case "AD":
		xfMin_MTM = GetField("收盤價", "AD") - GetField("收盤價", "AD")[length];

	case "AW":
		xfMin_MTM = GetField("收盤價", "AW") - GetField("收盤價", "AW")[length];

	case "AM":
		xfMin_MTM = GetField("收盤價", "AM") - GetField("收盤價", "AM")[length];

	default:
		xfMin_MTM = close - close[length];
end;