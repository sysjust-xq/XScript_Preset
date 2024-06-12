{@type:indicator}
condition996 = symbolexchange = "TW" = true and symboltype = 2;//個股

if condition996 = false //個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(0.01 * GetField("融券使用率"),"融券使用率",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//請RD加
