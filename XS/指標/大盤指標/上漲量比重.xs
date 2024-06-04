{@type:indicator|@guid:f5884f67fb24460da15651bdd6cf6685|@path:/大盤指標/上漲量比重|@hash:ca7ab599e8e5e8253b81d7018fa584d5}
{
指標說明
https://xstrader.net/盤上成交是否真的是重要指標/
}

if barfreq = "Tick" or barfreq = "Min" then 
begin
	value1=GetField("上漲量");
end else begin
	value1=GetField("上漲量","D");
end;

if volume<>0 then
	value2=value1/volume;
plot1(average(value2,5),"上漲量比重");