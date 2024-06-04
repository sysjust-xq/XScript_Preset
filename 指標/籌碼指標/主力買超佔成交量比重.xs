{@type:indicator|@guid:995222bea4e24cd3a884689a23665491|@path:/籌碼指標/主力買超佔成交量比重|@hash:9e17e3164ae9ec2e039f7ccf682ec924}
input:length(5,"期數"),TXT("僅支援日線以上");
var:_strplot1("");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率，僅支援日線以上");

value4=getField("主力買賣超張數", "D");
if volume<>0 then 
value5=(summation(value4,length)/summation(volume,length))*100;

_strplot1 = text("近 ",numToStr(length,0)," 期，主力買超佔成交量比重");
plot1(value5,"主力買超佔成交量比重");
setplotLabel(1,_strplot1);