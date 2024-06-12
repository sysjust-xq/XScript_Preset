{@type:indicator}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(GetField("散戶賣張"),"散戶賣出(張)",axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
plot2(GetField("實戶賣張"),"實戶賣出(張)",axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
plot3(GetField("控盤者賣張"),"控盤者賣出(張)",axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張