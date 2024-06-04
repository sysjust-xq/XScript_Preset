{@type:indicator|@guid:6d1fb133b0f84f2e840ec41623e6262c|@path:/籌碼高手/控盤者買賣盤|@hash:0a234f2069c4f6888a48736df8883203}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1 = GetField("控盤者買賣超張數")+value1;
plot1(value1,"累計買賣超(張)",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:張
plot2(GetField("控盤者買賣超張數"),"控盤者買賣超(張)",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:張