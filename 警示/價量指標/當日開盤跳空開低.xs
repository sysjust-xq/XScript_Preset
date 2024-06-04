{@type:sensor|@guid:8e678f9d33464f73b78ed312e2f1c58d|@path:/價量指標/當日開盤跳空開低|@hash:8ef102c4a71ddb3a6dd99d3c0a30127e}
input: UseQuote(True); setinputname(1,"使用即時價欄位");
input: Gap(1.5); setinputname(2,"跳空百分比(%)");
settotalbar(3);
if UseQuote then 
	Ret = IFF(100*(GetField("RefPrice", "D") -GetField("Open", "D")) > GetField("RefPrice", "D")*Gap, 1, 0)
else 
	Ret = IFF(date <> date[1] and 100*(close[1] -open) > close[1]*Gap, 1, 0);




        