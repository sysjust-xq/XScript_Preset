{@type:indicator|@guid:df654f81c9564f8cb639fddca5dc4470|@path:/籌碼高手/法人持股比例|@hash:2ade819a57e1a2700ed10827865b8ed3}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");


if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
plot1(0.01*GetField("法人持股比例"),"法人持股比例",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);