{@type:filter}
input: tp(150,"最低目標預期報酬率");

value1=GetField("累計營收年增率","M");
value2=GetField("月營收","M");//單位:億
value3=GetField("營業毛利率","Q");
value4=GetField("營業費用","Q");//單位百萬
value5=GetField("加權平均股本","Q");//單位億

{用月營收*毛利率-季營業費用/3來當單月本業獲利，
乘12當未來一年的本業獲利除以股本為預估的未來一年EPS}
value6=((value2*value3/100-value4/300)*12/(value5))*10;

//未來一年預估EPS*累計營收年增率為目標價
//但若累計營收年增率不到10就以10倍本益比來算目標價
if value1>10 and value1<20 then value7=value6*value1
else if value1>=20 then value7=value6*20
else value7=value6*10;

//用預估EPS乘上累計營收成長率當成目標價
if close<>0
then value8=((value7-close)/close)*100;

if GetField("月營收月增率","M")<30 and GetField("月營收年增率","M")<50
then begin
	if value8 > tp then ret=1;
	outputfield(1,value8,"預期報酬率");
	outputfield(2,value7,"目標價");
	outputfield(3,value6,"預估EPS");
	outputfield(4,value2,"最近月營收(億)");
	outputfield(5,value3,"毛利率");
	outputfield(6,value4,"季營業費用(百萬)");
	outputfield(7,value5,"加權股本(億)");
end;