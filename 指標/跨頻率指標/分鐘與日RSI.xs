{@type:indicator}
// 跨頻率RSI指標，預設跨頻率為30分
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率60分鐘，跨頻率計算30分鐘RSI技術指標。
//
input: 	Length1(6, "天數一"), Length2(12, "天數二"),
		FreqType("30", "跨頻率週期", inputkind:=dict(["1分鐘","1"],["5分鐘","5"],["10分鐘","10"],["15分鐘","15"],["30分鐘","30"],["60分鐘","60"],["日","D"],["還原日","AD"]));

if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("此範例僅支援分鐘、日與還原日頻率");

// 因 Getfield 第二個參數不支援動態變數字串，故使用以下語法表達跨分鐘頻率的RSI
// 防呆，大頻率跨小頻率時，在線圖秀不支援
//
switch (FreqType)
begin
	case  "1":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		if barinterval <> 1 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		value1 = xfMin_RSI("1", GetField("Close","1"), Length1);
		value2 = xfMin_RSI("1", GetField("Close","1"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "1分RSI");
		setplotlabel(2, "1分RSI");

	case  "5":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		value1 = xfMin_RSI("5", GetField("Close","5"), Length1);
		value2 = xfMin_RSI("5", GetField("Close","5"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "5分RSI");
		setplotlabel(2, "5分RSI");

	case "10":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		value1 = xfMin_RSI("10", GetField("Close","10"), Length1);
		value2 = xfMin_RSI("10", GetField("Close","10"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "10分RSI");
		setplotlabel(2, "10分RSI");

	case "15":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		value1 = xfMin_RSI("15", GetField("Close","15"), Length1);
		value2 = xfMin_RSI("15", GetField("Close","15"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "15分RSI");
		setplotlabel(2, "15分RSI");
		
	case "30":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		value1 = xfMin_RSI("30", GetField("Close","30"), Length1);
		value2 = xfMin_RSI("30", GetField("Close","30"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "30分RSI");
		setplotlabel(2, "30分RSI");

	case "60":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 and barinterval <> 45 and barinterval <> 60 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		value1 = xfMin_RSI("60", GetField("Close","60"), Length1);
		value2 = xfMin_RSI("60", GetField("Close","60"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "60分RSI");
		setplotlabel(2, "60分RSI");

	case "D":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於日");
		value1 = xfMin_RSI("D", GetField("Close","D"), Length1);
		value2 = xfMin_RSI("D", GetField("Close","D"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "日RSI");
		setplotlabel(2, "日RSI");
		
	case "AD":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於還原日");
		value1 = xfMin_RSI("AD", GetField("Close","AD"), Length1);
		value2 = xfMin_RSI("AD", GetField("Close","AD"), Length2);
		Plot1(value1, "分鐘與日RSI1");
		Plot2(value2, "分鐘與日RSI2");
		setplotlabel(1, "還原日RSI");
		setplotlabel(2, "還原日RSI");
	
end;
