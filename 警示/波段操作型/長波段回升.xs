{@type:sensor}
input: Length1(30); setinputname(1,"落底天數");
input: Size1(2000); setinputname(2,"量縮張數");
input: Length2(20); setinputname(3,"籌碼沉澱天數");
input: Size2(1000); setinputname(4,"籌碼清洗張數");
input: Ratio(10); setinputname(5,"融資使用率%");
input: Percent(3); setinputname(6,"今日漲幅%");
input: Type(1); setinputname(7,"融資資料：0=今日 1=昨日");
input: TXT1("僅適用日線"); setinputname(8,"使用限制");
input: TXT2("盤中無當日融資資料"); setinputname(9,"建議使用單次洗價模式");

settotalbar(maxlist(Length1,Length2) + 3);

variable:newlowcount(0);

if barfreq <> "D"  or (currenttime < 133000 and Type=0) then return;
if Type = 0 then value1 = 0 else value1 = 1;

condition1=false;
condition2=false;
condition3=false;
condition4=false;

if close/close[1] > 1 + Percent * 0.01 //今日強勢股
then condition1=true
else return;


if average(volume,Length1) < Size1//長期乏人問津
then condition2=true
else return;

if  trueany( Low < Low[1],length1) then return;//多日未破底


value2=GetField("Pomremain")[value1];//融資餘額
value3=GetField("Pomusingratio")[value1];//融資使用率
if value2[Length2]-value2 > Size2 and value3 < Ratio * 0.01//籌碼長期沈澱
then condition3 = true 
else return;

if average(truerange,5)>average(truerange,10)//短線波動幅度開始變大
then condition4 = true
else return;

if condition1 and condition2 and condition3 and condition4 
then ret=1;

