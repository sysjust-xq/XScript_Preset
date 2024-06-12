{@type:filter}
setbarfreq("AD");

input:period(30, "波段天期");

value2=nthhighestbar(1,close,period);//波段高點在第幾根Bar
if GetField("融資餘額張數","D")>average(volume,5)
//融資餘額大於五日均量
and GetField("融資餘額張數","D")[value2]>10000
//融資餘額大於一萬張
and GetField("融資餘額張數","D")[value2]>10000
//最高點時融資餘額也大於一萬張
and close*1.2<=close[value2]//波段跌幅超過兩成
then ret=1;

