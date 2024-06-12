{@type:indicator}
{市場成交量定義

加權成交量 GetSymbolField("TSE.TW", "成交量"):
https://www.twse.com.tw/zh/page/trading/exchange/MI_INDEX.html
總計(1~15)欄位的成交金額(元)

上櫃成交量 GetSymbolField("OTC.TW", "成交量"):
https://www.tpex.org.tw/web/stock/aftertrading/market_statistics/statistics.php?l=zh-tw
股票合計(1~3)欄位的成交金額(元)
}

if barfreq = "Tick" or barfreq = "Min" then raiseruntimeerror("只支援日線以上");

value1 = GetSymbolField("TSE.TW", "外資買賣超金額") + GetSymbolField("OTC.TW", "外資買賣超金額");
value2 = GetSymbolField("TSE.TW", "成交量") + GetSymbolField("OTC.TW", "成交量");
if value2 = 0 then value3 = 0 else value3 = value1/value2*100;

plot1(value3,"佔比(%)");