{@type:sensor}
if close*1.5<close[40]
//過去四十個交易日跌了超過四成
and countif(open > close[1],5)>=3
//過去五天有三天以上開盤比前一天收盤高
and GetSymbolField("tse.tw","收盤價","D")
>average(GetSymbolField("tse.tw","收盤價","D"),10)
//指數位於十日均線之上
and average(volume,5)>2000
//五日均量大於2000張
then ret=1;