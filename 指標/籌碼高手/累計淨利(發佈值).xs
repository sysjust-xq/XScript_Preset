{@type:indicator}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and (symboltype = 2 or symboltype = 1);//個股+興櫃+類股

if condition998 = false //個股+興櫃+類股
	then raiseruntimeerror("不支援此商品");

if GetField("累計淨利(發佈值)","Q")[4] <> 0 then
	value1 = (GetField("累計淨利(發佈值)","Q") - GetField("累計淨利(發佈值)","Q")[4]) / GetField("累計淨利(發佈值)","Q")[4]*100;

plot1(GetField("累計淨利(發佈值)","Q"),"累計淨利(發佈值)");
plot2(value1,"年增率(%)");