{@type:indicator|@guid:37927c18e3794c99825dcdd27e494756|@path:/籌碼指標/散戶賣出比例|@hash:01ed8cd69ce859a79c16cb4f5f8d25f3}
input:Period(5,"MA期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("散戶賣張");
if volume<>0 then 
	value2=value1/volume*100;
value3=average(value2,Period);

plot1(value3,"散戶賣出比例");

