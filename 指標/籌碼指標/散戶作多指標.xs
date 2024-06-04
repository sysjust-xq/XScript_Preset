{@type:indicator|@guid:096354fd993742a787a66abf0c33eae7|@path:/籌碼指標/散戶作多指標|@hash:1a28e953db8133683f4520256a0e8844}
input:Period(10,"MA期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("融資買進張數");
value2=GetField("融券買進張數");
if volume <> 0 then
	value3=(value1+value2)/volume;
value4=average(value3,Period);

plot1(value4,"散戶作多指標");
