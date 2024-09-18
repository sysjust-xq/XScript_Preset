{@type:indicator}
{指標數值定義：(上漲)量 = 開盤累計到目前比前一價(上漲)的成交量的加總

支援商品：台股,大盤,類股,期貨,選擇權}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");
	
value91 = GetField("上漲量");

value1 = GetField("上漲量","D");
value2 = GetField("下跌量","D");
value3 = value1 - value2;
plot1(value3,"漲跌成交");
plot2(value1,"上漲量",checkbox:=0);
plot3(value2,"下跌量",checkbox:=0);