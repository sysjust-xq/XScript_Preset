{@type:indicator|@guid:2c8bc5919b9c483789f94ec3eaf8af7d|@path:/籌碼指標/自營商買超佔成交量比重|@hash:2bc66971482edf5608dc0297f0f32347}
input:length(5,"期數"),TXT("僅支援日線以上");
var:_strplot1("");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率，僅支援日線以上");

value4=getField("自營商買賣超", "D");
if volume<>0 then 
value5=(summation(value4,length)/summation(volume,length))*100;

_strplot1 = text("近 ",numToStr(length,0)," 期，自營商買超佔成交量比重");
plot1(value5,"自營商買超佔成交量比重");
setplotLabel(1,_strplot1);