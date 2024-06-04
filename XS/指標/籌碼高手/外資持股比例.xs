{@type:indicator|@guid:fa8689b5fe244273a4c6e91b95fdc3b7|@path:/籌碼高手/外資持股比例|@hash:0b46f7d67fe575d7d8d3e86b0d7d2d8b}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");



if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
plot1(0.01*GetField("外資持股比例"),"外資持股比例",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);