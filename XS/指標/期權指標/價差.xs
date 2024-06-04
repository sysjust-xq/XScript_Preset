{@type:indicator|@guid:c438145ffd2847d08b330a362bdb3fdd|@path:/期權指標/價差|@hash:4f88ea2f3e53604da07f0188fbd89ae1}
condition999 = symbolexchange = "TF";//期貨
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TF" and symboltype = 5;//選擇權

if (condition999 = false and condition994 = true) or symbolType = 5	//僅支援期貨
	then raiseruntimeerror("不支援此商品");
	
if symbolexchange = "TF" and symboltype = 3  then	//期貨
	value1 = GetSymbolField("Underlying", "收盤價");	

plot1(close-value1,"價差");