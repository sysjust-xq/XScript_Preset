{@type:indicator|@guid:bf8795a8f6cf42dcafd00bf4104c5b7a|@path:/籌碼高手/融券使用率|@hash:77a4b15164bbd2847e65634f0aa6cfe7}
condition996 = symbolexchange = "TW" = true and symboltype = 2;//個股

if condition996 = false //個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(0.01 * GetField("融券使用率"),"融券使用率",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//請RD加
