{@type:indicator}
input:length1(19,"短天期"),length2(39,"長天期");

if barfreq = "Tick" or barfreq = "Min" then
begin
	value1=GetField("上漲量");
	value2=getfield("下跌量");
end else begin
	value1=GetField("上漲量","D");
	value2=getfield("下跌量","D");
end;

value3=value1-value2;
value4=Xaverage(value3,length1)-Xaverage(value3,length2);
plot1(value4,"麥克連震盪指標");