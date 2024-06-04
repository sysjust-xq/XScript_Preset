{@type:indicator|@guid:ec58c7b9eb6344d59aff3b89da0d579b|@path:/籌碼高手/申報轉讓|@hash:894e2f8df18419f56357763222ca5333}
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

if condition994 =false and condition993 = false //大盤+類股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD" and
	barfreq <> "W" and barfreq <> "AW" and
	barfreq <> "M" and barfreq <> "AM"
	then raiseruntimeerror("不支援此頻率");


plot1(Getfield("申報總市值"),"申報總市值",axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
plot2(Getfield("申報家數"),"申報家數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
plot3(Getfield("申報人數"),"申報人數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
