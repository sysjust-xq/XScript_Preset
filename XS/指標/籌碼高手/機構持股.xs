{@type:indicator|@guid:f2a1153a3d5048d0ac116ad8a59a3b69|@path:/籌碼高手/機構持股|@hash:cfc5cd85669b5cee7a66aca3cebd3e04}
//資料更新頻率：季
//支援商品：美(股票)
if barfreq = "Tick" or barfreq = "Min" then raiseruntimeerror("不支援此頻率");
	
var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

plot1(GetField("機構持股比重", "Q")/100,"機構持股比重",Checkbox:=1);//機購持股比重
plot2(GetField("機構持股", "Q"),"持股數值",Checkbox:=0);//持股數值