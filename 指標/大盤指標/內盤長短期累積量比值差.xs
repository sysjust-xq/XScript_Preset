{@type:indicator}
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





 


