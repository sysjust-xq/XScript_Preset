{@type:indicator|@guid:c019d383580043e39c24966fa5a5aea2|@path:/籌碼指標/不明買盤指標|@hash:4982aabc7a17f67d3249ed96e129e954}
input:period(5,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("法人買張");
value2=GetField("當日沖銷張數");
value3=GetField("散戶買張");
value4=volume-value1-value2-value3;
if volume <> 0 then
	value5=value4/volume;
value6=average(value5,period);
plot1(value6,"不明買盤比例");