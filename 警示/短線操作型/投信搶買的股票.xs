{@type:sensor}
input: miniratio(10); setinputname(1,"投信買進佔今日總量%");
input: lv(2000); setinputname(2,"投信持股張數上限");
input: holdratio(10); setinputname(3,"投信持股比例上限%");
input:TXT1("僅適用日線"); setinputname(4,"使用限制");
input:TXT2("需選用逐筆洗價"); setinputname(5,"使用說明");
settotalbar(3);

if BarFreq <> "D"  then return;

//1.中小型股
//2.原來庫存低
//3.今天買進張數超過成交量的一成
//4.收今天最高

value1=GetField("Stotalbuy")[1];//投信買張
value2=GetField("Ssharesheld")[1];//投信持股
value3=GetField("Ssharesheldratio")[1];//投信持股比例

if close > high[1] and close[1]=high[1]   and //昨天收高 今日再漲
   value1 > volume[1] * miniratio*0.01 and //昨日買進張數超過成交量的一成
   value2 < lv and //原來庫存低
   value3 < holdratio //原來庫存低
then ret=1;
