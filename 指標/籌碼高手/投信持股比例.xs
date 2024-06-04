{@type:indicator|@guid:2e12dfbe4e794ace8dbeac7bf486f265|@path:/籌碼高手/投信持股比例|@hash:1f4933b7222393438bb4ac5e2391528d}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");



if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(0.01*GetField("投信持股比例"),"投信持股比例",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);