{@type:indicator}
// 跨頻率KD指標，預設跨頻率為30分
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率60分鐘，跨頻率計算30分鐘KD技術指標。
//
input:	Length(9, "天數"), RSVt(3, "RSVt權數"), Kt(3, "Kt權數"),
		FreqType("30", "跨頻率週期", inputkind:=dict(["1分鐘","1"],["5分鐘","5"],["10分鐘","10"],["15分鐘","15"],["30分鐘","30"],["60分鐘","60"],["日","D"],["還原日","AD"]));
variable: rsv(0), k(0), _d(0);

if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("此範例僅支援分鐘、日與還原日頻率");

xfMin_stochastic(FreqType, Length, RSVt, Kt, rsv, k, _d);

Plot1(k, "分鐘與日K(%)");
Plot2(_d, "分鐘與日D(%)");

// 防呆，大頻率跨小頻率時，在線圖秀不支援
//
switch (FreqType)
begin
	case  "1":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		if barinterval <> 1 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		setplotlabel(1, "1分K(%)");
		setplotlabel(2, "1分D(%)");

	case  "5":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		setplotlabel(1, "5分K(%)");
		setplotlabel(2, "5分D(%)");

	case "10":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		setplotlabel(1, "10分K(%)");
		setplotlabel(2, "10分D(%)");

	case "15":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		setplotlabel(1, "15分K(%)");
		setplotlabel(2, "15分D(%)");
		
	case "30":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		setplotlabel(1, "30分K(%)");
		setplotlabel(2, "30分D(%)");

	case "60":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 and barinterval <> 45 and barinterval <> 60 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		setplotlabel(1, "60分K(%)");
		setplotlabel(2, "60分D(%)");
	
	case "D":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於日");
		setplotlabel(1, "日K(%)");
		setplotlabel(2, "日D(%)");

	case "AD":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於還原日");
		setplotlabel(1, "還原日K(%)");
		setplotlabel(2, "還原日D(%)");		

end;

