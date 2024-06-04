{@type:indicator|@guid:e8212992ec69430da84f5318a43c7b68|@path:/籌碼高手/庫藏股指標|@hash:e957048ae009b7666fc19e6baa471175}
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW" or symbolType = 1;//大盤、類股

if condition994 = false //大盤、類股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(GetField("庫藏股申請總市值")*1000,"申報總市值",axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位:千元
plot2(GetField("庫藏股申請家數"),"申報家數",checkbox:=0,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位:家