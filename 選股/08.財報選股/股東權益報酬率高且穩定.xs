{@type:filter}
input:years(5);		setinputname(1,"評估期間(年)");
input:r1(15);		setinputname(2,"ROE下限(%)");
input:r2(3);		setinputname(3,"ROE最大差異(%)");
input:fx("資料頻率");	SetInputName(4, "使用限制:請選擇年頻率");

if barfreq <> "Y" then raiseruntimeerror("頻率錯誤");

settotalbar(3);

value1=GetField("股東權益報酬率","Y");

value2=lowest(GetField("股東權益報酬率","Y"), years);
value3=highest(GetField("股東權益報酬率","Y"), years);

if (value3 - value2) < r2 and value2 > r1 
then ret=1;

setoutputname1("ROE(%)");
outputfield1(value1);


