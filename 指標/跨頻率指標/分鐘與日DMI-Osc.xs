{@type:indicator}
// 跨頻率DMI-Osc指標，預設跨頻率為30分鐘
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率60分鐘，跨頻率計算30分鐘DMI-Osc技術指標。
//
input:	Length(14, "天數"),
		FreqType("30", "跨頻率週期", inputkind:=dict(["1分鐘","1"],["5分鐘","5"],["10分鐘","10"],["15分鐘","15"],["30分鐘","30"],["60分鐘","60"],["日","D"],["還原日","AD"]));

variable: pdi_value(0), ndi_value(0), adx_value(0);

if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("此範例僅支援分鐘、日與還原日頻率");

xfMin_DirectionMovement(FreqType, Length, pdi_value, ndi_value, adx_value);

// 初始區波動較大, 先不繪出
//
if CurrentBar < Length then
 begin
	pdi_value = 0;
	ndi_value = 0;
	adx_value = 0;
 end;

Plot1(pdi_value - ndi_value, "分鐘與日DMI-Osc");

// 防呆，大頻率跨小頻率時，在線圖秀不支援
//
switch (FreqType)
begin
	case  "1":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		if barinterval <> 1 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於1分鐘");
		setplotlabel(1, "1分DMI-Osc");

	case  "5":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於5分鐘");
		setplotlabel(1, "5分DMI-Osc");

	case "10":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於10分鐘");
		setplotlabel(1, "10分DMI-Osc");

	case "15":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於15分鐘");
		setplotlabel(1, "15分DMI-Osc");
		
	case "30":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於30分鐘");
		setplotlabel(1, "30分DMI-Osc");

	case "60":
		if barfreq <> "Tick" and barfreq <> "Min" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		if barinterval <> 1 and barinterval <> 2 and barinterval <> 3 and barinterval <> 5 and barinterval <> 10 and barinterval <> 15 and barinterval <> 20 and barinterval <> 30 and barinterval <> 45 and barinterval <> 60 then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於60分鐘");
		setplotlabel(1, "60分DMI-Osc");
	
	case "D":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於日");
		setplotlabel(1, "日DMI-Osc");
		
	case "AD":
		if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then raiseruntimeerror("不支援大頻率跨小頻率：主頻率大於還原日");
		setplotlabel(1, "還原日DMI-Osc");

end;
