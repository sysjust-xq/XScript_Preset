{@type:indicator|@guid:86964cd567ca481ab64ce6217c29d5d8|@path:/技術指標/勁道指標|@hash:9ed381b9091ac62d38049b51f2d3d7fd}
{
指標說明
https://xstrader.net/積極勁道指標/
}

input:day(13,"期數");

if barfreq = "Tick" or barfreq = "Min" then
begin
	value1=GetField("外盤量");//單位:元
	value6=GetField("內盤量");//單位:元
end else begin
	value1=GetField("外盤量","D");//單位:元
	value6=GetField("內盤量","D");//單位:元
end;
value2=volume*(close-close[1]);
value8=average(volume,day);
if value6<>0 then 
	value7=(value1/value6)*volume*(close-close[1]);
value3=value7*(close-close[1]);
value4=average(value2,day)/value8;
value5=average(value3,day)/value8;


plot1(value4,"勁道指標");
plot2(value5,"積極勁道指標");