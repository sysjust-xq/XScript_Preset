{@type:function}
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





