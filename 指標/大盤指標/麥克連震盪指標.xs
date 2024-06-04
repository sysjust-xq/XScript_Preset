{@type:indicator|@guid:dd2e74634b6347dfabe2e19191f98ec0|@path:/大盤指標/麥克連震盪指標|@hash:edc90e147a3d127670a0873c42ad70c6}
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