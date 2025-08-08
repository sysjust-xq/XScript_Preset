{@type:indicator}
//說明：
//交易所公布的總持股人數。
//執行商品為股票時，支援「週」以上的頻率。
//執行商品為可轉債時，支援「月」以上的頻率。

condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and (symboltype = 2 or symbolType = 1 or symboltype = 6);//個股+類股+可轉債

if condition998 = false //個股+興櫃+類股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if symboltype = 2 or symbolType = 1 then begin
	if barFreq = "D" then
		value1 = GetField("總持股人數","W")
	else
		value1 = GetField("總持股人數");
end;

if symboltype = 6 then begin
	if barFreq = "D" or barFreq = "W"  then
		value1 = GetField("總持股人數","M")
	else
		value1 = GetField("總持股人數");
end;

plot1(value1,"總持股人數");