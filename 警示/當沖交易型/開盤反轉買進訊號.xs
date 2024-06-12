{@type:sensor}
variable: _BarIndex(0), _Open(0), _Low(0), _High(0), _Volume(0);

if getsymbolfield("tse.tw","收盤價") > average(getsymbolfield("tse.tw","收盤價"),10) then begin
	if Date <> Date[1] then begin
		_BarIndex = 1;
		_Open = Open;
		_Low = Low;
		_High = High;
		_Volume = Volume;
	end else begin
		_Low = minlist(_Low, Low);
		_High = maxlist(_High, High);
		_Volume = _Volume + Volume;
		_BarIndex = _BarIndex + 1;
	end;
  
	Condition1 = GetField("Open", "D") < GetField("Close", "D")[1];
	//開低
	Condition2 = Close > _Low * 1.02 and close>GetField("收盤價","D")[1];
	//收盤比當天低點收高2%且突破前一日高點
	Condition3 = Close*1.2 < GetField("Close", "D")[20]
	//近二十日跌幅超過兩成
	and close*1.07<getfield("close","D")[10];
	//近十日跌幅超過7%
	Condition4 = Time < 93000;
	//時間在九點半之前
	Condition5 = Average(GetField("Volume", "D")[1], 5) >= 1000;
	//五日均量大於1000張
	Condition6 = _Volume > GetField("Volume", "D")[1] * 0.2;
	//今日迄今的量大於過去五日均量的兩成
	if Condition1 And Condition2 And Condition3 And Condition4 And Condition5 And Condition6
	then ret = 1;
end;