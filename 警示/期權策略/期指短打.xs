{@type:sensor}
if barfreq<>"Min" or barinterval<>1 then raiseruntimeerror("頻率請用1分K");

variable:l1(0),l2(0),l3(0),l4(0),l5(0),l6(0),l7(0),l8(0),l9(0),l10(0),x(0),i(0), base(0);
variable:day(3);

if GetField("日期","Tick") <> currentdate then return;
if time = 091500 then begin
	base = GetField("收盤價","Tick");   // 基準點
	x = 0;
	for i=1 to day
		x=highd(i)-lowd(i)+x;
	value4=x/day;

	l1=base+value4*0.191;
	l2=base+value4*0.382;
	l3=base+value4*0.5;
	l4=base+value4*0.618;
	l5=base+value4*0.809;
	l6=base-value4*0.191;
	l7=base-value4*0.382;
	l8=base-value4*0.5;
	l9=base-value4*0.618;
	l10=base-value4*0.809;
end;

if base <> 0 then begin  
    if GetField("收盤價","Tick") crosses over base+6 then begin
		ret=1;
		retmsg="作多第一口";
    end;
    if GetField("收盤價","Tick") crosses over base+12 then begin
		ret=1;
		retmsg="作多第二口";
    end;
    if GetField("收盤價","Tick") crosses over base+18 then begin
		ret=1;
		retmsg="作多第三口";
    end;
    if GetField("收盤價","Tick") crosses over base+24 then begin
		ret=1;
		retmsg="作多第四口";
    end;
    if GetField("收盤價","Tick") crosses over base+30 then begin
		ret=1;
		retmsg="作多第五口";
    end;
    if GetField("收盤價","Tick") crosses over base+36 then begin
		ret=1;
		retmsg="作多第六口";
    end;
    if GetField("收盤價","Tick") crosses under value3-6 then begin
		ret=1;
		retmsg="作空第一口";
    end;
    if GetField("收盤價","Tick") crosses under value3-12 then begin
		ret=1;
		retmsg="作空第二口";
    end;
    if GetField("收盤價","Tick") crosses under value3-18 then begin
		ret=1;
		retmsg="作空第三口";
    end;
    if GetField("收盤價","Tick") crosses under value3-24 then begin
		ret=1;
		retmsg="作空第四口";
    end;
    if GetField("收盤價","Tick") crosses under value3-30 then begin
		ret=1;
		retmsg="作空第五口";
    end;
    if GetField("收盤價","Tick") crosses under value3-36 then begin
		ret=1;
		retmsg="作空第六口";
    end;
    
    if GetField("收盤價","Tick") crosses over l1
    or GetField("收盤價","Tick") crosses over l2
    or GetField("收盤價","Tick") crosses over l3
    or GetField("收盤價","Tick") crosses over l4
    or GetField("收盤價","Tick") crosses over l5
    then begin
		ret=1;
		retmsg="50秒後請自動平倉";
    end;
    if GetField("收盤價","Tick") crosses under l6
    or GetField("收盤價","Tick") crosses under l7
    or GetField("收盤價","Tick") crosses under l8
    or GetField("收盤價","Tick") crosses under l9
    or GetField("收盤價","Tick") crosses under l10
    then begin
		ret=1;
		retmsg="50秒後請自動平倉";
    end;
end;

print(date,time,GetField("日期","Tick"),GetField("時間","Tick"),GetField("收盤價","Tick"),l1);