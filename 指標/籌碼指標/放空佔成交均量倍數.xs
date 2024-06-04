{@type:indicator|@guid:dac678a4319648a7ba9d3258b1eed0b2|@path:/籌碼指標/放空佔成交均量倍數|@hash:8a6a8ce75fef90f89b191850f9256cca}
{
指標說明
https://xstrader.net/借券相關欄位在交易策略上的應用/
}

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

value1=GetField("借券餘額張數","D");
value2=GetField("融券餘額張數","D");
if volume<>0 then 
	value3=(value1+value2)/average(volume,20);
plot1(value3,"放空佔成交均量倍數");