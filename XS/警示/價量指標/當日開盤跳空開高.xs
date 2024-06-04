{@type:sensor|@guid:aedfb58fc66d438a891146d6f1936a05|@path:/價量指標/當日開盤跳空開高|@hash:da65ea635de75115e9fe7d1842ed7723}
input: UseQuote(True); setinputname(1,"使用即時價欄位");
input: Gap(1.5); setinputname(2,"跳空百分比(%)");
settotalbar(3);
if UseQuote then 
	Ret = IFF(100*(GetField("Open", "D") -GetField("RefPrice", "D")) > GetField("RefPrice", "D")*Gap, 1, 0)
else 
	Ret = IFF(date <> date[1] and 100*(open - close[1]) > close[1]*Gap, 1, 0);




        