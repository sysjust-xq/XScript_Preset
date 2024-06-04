{@type:indicator|@guid:8e0f281d51ae4a1bbcbc9a64514e28af|@path:/籌碼指標/散戶買進比例|@hash:2b887e1691f08926e3196c7338254a40}
input:Period(5,"MA期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("散戶買張");
if volume<>0 then 
	value2=value1/volume*100;
value3=average(value2,Period);

plot1(value3,"散戶買進比例");

