{@type:indicator|@guid:29c31eabf45841d0a471452a9d39f0e1|@path:/籌碼高手/CB轉換溢價率|@hash:7baa5fac8b4a05698274ad1aba402f99}
{
	支援商品：可轉債商品。
	支援頻率：分鐘以上的頻率。
	繪圖序列1是「可轉債轉換溢價率」的線條。
}
if SymbolType <> 6 then RaiseRunTimeError("不支援此商品");
if GetSymbolInfo("轉換價格") <> 0 then	//避免分母為0
	value1 = (100 / GetSymbolInfo("轉換價格")) * GetSymbolField("Underlying", "收盤價");//轉換價值 = (100 / 轉換價格) x 股票現價
if value1 <> 0 then
	value2 = (close - value1)/value1;//轉換溢價率(%) = (CB價格 - 轉換價值) / 轉換價值
	
plot1(value2,"轉換溢價率");