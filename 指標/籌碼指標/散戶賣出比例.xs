{@type:indicator}
input:Period(5,"MA期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("散戶賣張");
if volume<>0 then 
	value2=value1/volume*100;
value3=average(value2,Period);

plot1(value3,"散戶賣出比例");

