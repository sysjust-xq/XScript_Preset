{@type:indicator|@guid:3599a1ef88d44bd1883841455142d45c|@path:/籌碼高手/實戶買賣盤|@hash:50e588117abba5aef832ebb93c33c0ea}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1 = GetField("實戶買賣超張數")+value1;
plot1(value1,"累計買賣超(張)",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:張
plot2(GetField("實戶買賣超張數"),"實戶買賣超(張)",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:張