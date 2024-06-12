{@type:indicator}
input:length1(20,"長天期"),length2(9,"短天期");

variable:count1(0),x1(0);

count1=0;
for x1=1 to length2-1 begin
	if high < close*1.01 then 
		count1=count1+1;
	if open > close[1]*1.005 then
		count1=count1+1;
	if close > close[1] and volume>volume[1] then
		count1=count1+1;
	if GetField("外盤量") > GetField("內盤量") then
		count1=count1+1;
end;


value2=average(count1,length1);
value3=average(count1,length2);

plot1(value2,"長期意願");
plot2(value3,"短期意願");


