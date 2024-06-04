{@type:filter|@guid:fbbf0cd7295d45e699e7a347a60f8d49|@path:/08.財報選股/總市值接近歷史低點}
input: r1(5);			setinputname(1, "接近低點幅度(%)");
//input:TXT("僅適用月資料"); setinputname(2,"使用限制");
setbarfreq("M");

if barfreq <> "M" then raiseruntimeerror("頻率錯誤");

settotalbar(3);

value1=GetField("總市值","M");
value2=nthlowest(1,GetField("總市值","M"),48);
value3=nthlowest(1,GetField("總市值","M"),24);

if absvalue(value2-value3)*100 / value3 < r1
then 
  begin
	if (value1-value2) * 100 / value2 < r1 and
	   (value1-value3) * 100 / value3 < r1 
	then
		ret=1;
  end;
	
SetOutputName1("最近市值(億)");
OutputField1(value1);
