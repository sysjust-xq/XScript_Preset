{@type:indicator|@guid:c86c566e4b8448b5a2b563d96ada76e5|@path:/大盤指標/內盤長短期累積量比值差|@hash:7289ec2b3e326623560c4c6d40725055}
input:length1(5,"短天期"),length2(20,"長天期");

variable:ac(0),ds(0),ac1(0),ds1(0);

if barfreq = "Tick" or barfreq = "Min" then 
begin
	value1=GetField("內盤量");//單位:元
	value2=GetField("外盤量");//單位:元
end else begin
	value1=GetField("內盤量","D");//單位:元
	value2=GetField("外盤量","D");//單位:元
end;
value3=summation(value1,length1);
value4=summation(value2,length1);
value5=summation(value1,length2);
value6=summation(value2,length2);
value7=summation(volume,length1);
value8=summation(volume,length2);

ac=value4/value7*100;//外盤短期積量比值
ds=value3/value7*100;//內盤短期積量比值
ac1=value6/value8*100;//外盤長期積量比值
ds1=value5/value8*100;//內盤長期積量比值

value11=ds1-ds;
plot1(value11,"內盤長短期積量比值差");





 


