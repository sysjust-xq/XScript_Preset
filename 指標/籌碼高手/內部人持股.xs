{@type:indicator|@guid:8725d261f52c4bb1af50f96309ba3d99|@path:/籌碼高手/內部人持股|@hash:c1803b8d3185c5074fa51f7322263ac1}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃+類股
	then raiseruntimeerror("不支援此商品");


if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(0.01*Getfield("內部人持股比例","M"),"內部人持股比例",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//請RD加
plot2(Getfield("內部人持股張數","M"),"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);