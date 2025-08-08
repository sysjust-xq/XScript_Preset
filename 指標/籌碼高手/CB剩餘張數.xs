{@type:indicator}
if SymbolType <> 6 then RaiseRunTimeError("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if barFreq = "D" then
	value1 = getField("CB剩餘張數","w")
else
	value1 = GetField("CB剩餘張數");

plot1(value1,"CB剩餘張數");