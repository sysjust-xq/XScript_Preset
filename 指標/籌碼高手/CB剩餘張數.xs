{@type:indicator|@guid:9b5b93997e2b490a93809b214caa4100|@path:/籌碼高手/CB剩餘張數|@hash:9be2b610c0c08c51d431c498f4b4c2f2}
if SymbolType <> 6 then RaiseRunTimeError("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if barFreq = "D" then
	value1 = getField("CB剩餘張數","w")
else
	value1 = GetField("CB剩餘張數");

plot1(value1,"CB剩餘張數");