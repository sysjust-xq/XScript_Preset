{@type:indicator|@guid:de3943a5fc7c4fceac51ddd1b020e33f|@path:/籌碼高手/自營商持股比例|@hash:e1e3bffc9a12af99d790738ce43f810c}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");


if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
plot1(0.01*GetField("自營商持股比例"),"自營商持股比例",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);