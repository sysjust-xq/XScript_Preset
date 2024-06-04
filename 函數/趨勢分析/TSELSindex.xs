{@type:function|@guid:b1f1a25bdc014e109dc92d7f9b6ef207|@path:/趨勢分析/TSELSindex}
{
函數說明
https://xstrader.net/打造自己的大盤多空函數/
}

SetBarMode(1);

input:Length(numeric);
input:LowLimit(numeric);
 
if countif(GetSymbolField("tse.tw","外資買賣超金額","D") > 0,Length) >= LowLimit
and GetSymbolField("tse.tw","外資買賣超金額","D") > 0 then
	value1 = 1
else
	value1 = 0;

tselsindex = value1;





