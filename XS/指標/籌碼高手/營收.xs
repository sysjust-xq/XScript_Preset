{@type:indicator|@guid:1632a74a243649f7ab40b2c7fb3a0a32|@path:/籌碼高手/營收|@hash:9ae6b758d0a7771ecb290f350ac0a92c}
Var:_Sales(0);

condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and (symboltype = 2 or symboltype = 1);//個股+興櫃+類股

if condition998 = false //個股+興櫃+類股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min" or barfreq = "Q" or barfreq = "H" or barfreq = "Y"
	then raiseruntimeerror("不支援此頻率");

if GetField("月營收","M") <> 0 then
	value1 = rateOfChange(GetField("月營收","M"),1) / 100;

if GetField("月營收","M")[12] <> 0 then
	value2 = (GetField("月營收","M") - GetField("月營收","M")[12]) / GetField("月營收","M")[12];

plot1(GetField("月營收","M")*100000000,"月營收",axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sd2);
plot2(value1,"月增率",checkbox:=1,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
plot3(value2,"年增率",checkbox:=1,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);