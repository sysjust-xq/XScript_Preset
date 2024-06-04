{@type:indicator|@guid:f8b2b7af16314bac90a8b7bc6cd0c426|@path:/籌碼高手/散戶買賣盤|@hash:7dbf499c22f6b000e28c1acd186fd1ea}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1 = GetField("散戶買賣超張數")+value1;
plot1(value1,"累計買賣超(張)",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:張
plot2(GetField("散戶買賣超張數"),"散戶買賣超(張)",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:張