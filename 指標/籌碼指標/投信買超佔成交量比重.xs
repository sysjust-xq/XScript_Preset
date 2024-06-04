{@type:indicator|@guid:91e46807a54143e9b69cce4370b2d5d6|@path:/籌碼指標/投信買超佔成交量比重|@hash:b3c268f0ac6acc4c8a232008a449ee72}
input:length(5,"期數"),TXT("僅支援日線以上");
var:_strplot1("");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率，僅支援日線以上");

value4=getField("投信買賣超張數", "D");
if volume<>0 then 
value5=(summation(value4,length)/summation(volume,length))*100;

_strplot1 = text("近 ",numToStr(length,0)," 期，投信買超佔成交量比重");
plot1(value5,"投信買超佔成交量比重");
setplotLabel(1,_strplot1);