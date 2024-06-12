{@type:indicator}
{
指標說明
https://xstrader.net/otc跟上市成交量比值是股市多空指標/
}

input: Period(5,"期數");

value1=GetSymbolField("tse.tw","成交量");
value2=GetSymbolField("otc.tw","成交量");
value3=value2/value1*100;
value4=average(value3,Period);

plot1(value4,"OTC/TSE(%)");
Plot2(value2,"OTC成交量");
