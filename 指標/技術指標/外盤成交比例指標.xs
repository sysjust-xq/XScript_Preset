{@type:indicator|@guid:b91923cb155347c99fb4cf8817e7c649|@path:/技術指標/外盤成交比例指標|@hash:e13eca3a42653187b98db810376794fb}
{
指標說明
https://xstrader.net/外盤成交比例指標/
}

input:
	short1(5,"短期平均"),
	mid1(12,"長期平均");

if barfreq = "Tick" or barfreq = "Min" then
begin
	value1=GetField("內盤量");//單位:元
	value2=GetField("外盤量");//單位:元
end else begin
	value1=GetField("內盤量","D");//單位:元
	value2=GetField("外盤量","D");//單位:元
end;
value3=value1+value2;
if value3<>0 then 
	value4=value2/value3*100;
value5=average(value4,short1);
value6=average(value4,mid1);

plot1(value5,"短期均線");
plot2(value6,"長期均線");

