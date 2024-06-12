{@type:indicator}
// 跨頻率威廉指標，預設跨頻率為30分
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率60分鐘，跨頻率計算30分鐘威廉技術指標。
//
input: 
	Length1(14, "天數一"), Length2(28, "天數二"), Length3(42, "天數三"),
	FreqType("30", "跨頻率週期", inputkind:=dict(["1分鐘","1"],["5分鐘","5"],["10分鐘","10"],["15分鐘","15"],["30分鐘","30"],["60分鐘","60"],["日","D"],["還原日","AD"]));

if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("此範例僅支援分鐘、日與還原日頻率");

value1 = xfMin_PercentR(FreqType, Length1) - 100;
value2 = xfMin_PercentR(FreqType, Length2) - 100;
value3 = xfMin_PercentR(FreqType, Length3) - 100;

Plot1(value1, "分鐘與日威廉指標1");
Plot2(value2, "分鐘與日威廉指標2");
Plot3(value3, "分鐘與日威廉指標3");

// 防呆，大頻率跨小頻率時，在線圖秀不支援
//
switch (FreqType)
begin
	case  "1":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		if barinterval <> 1 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		setplotlabel(1, "1分威廉指標1");
		setplotlabel(2, "1分威廉指標2");
		setplotlabel(3, "1分威廉指標3");

	case  "5":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		setplotlabel(1, "5分威廉指標1");
		setplotlabel(2, "5分威廉指標2");
		setplotlabel(3, "5分威廉指標3");

	case "10":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		setplotlabel(1, "10分威廉指標1");
		setplotlabel(2, "10分威廉指標2");
		setplotlabel(3, "10分威廉指標3");

	case "15":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		setplotlabel(1, "15分威廉指標1");
		setplotlabel(2, "15分威廉指標2");
		setplotlabel(3, "15分威廉指標3");
		
	case "30":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		setplotlabel(1, "30分威廉指標1");
		setplotlabel(2, "30分威廉指標2");
		setplotlabel(3, "30分威廉指標3");

	case "60":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 and barinterval <> 45 and barinterval <> 60 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		setplotlabel(1, "60分威廉指標1");
		setplotlabel(2, "60分威廉指標2");
		setplotlabel(3, "60分威廉指標3");
		
	case "D":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於日");
		setplotlabel(1, "日威廉指標1");
		setplotlabel(2, "日威廉指標2");
		setplotlabel(3, "日威廉指標3");
		
	case "AD":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於還原日");
		setplotlabel(1, "還原日威廉指標1");
		setplotlabel(2, "還原日威廉指標2");
		setplotlabel(3, "還原日威廉指標3");

end;
	