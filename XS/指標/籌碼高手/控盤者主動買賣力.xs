{@type:indicator|@guid:31f47d809bda4a97a864484c5c95a460|@path:/籌碼高手/控盤者主動買賣力|@hash:a637b27271154aa2c430af1e554e6405}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(GetField("主動性交易比重"),"交易比重",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd2);
plot2(GetField("主動買力"),"主動買力",checkbox:=0,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd2);
plot3(GetField("主動賣力"),"主動賣力",checkbox:=0,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd2);