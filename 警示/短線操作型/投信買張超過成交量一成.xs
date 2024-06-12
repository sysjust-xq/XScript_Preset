{@type:sensor}
input: Ratio(10); setinputname(1,"投信持股%");
input: Gap(2.5); setinputname(2,"開盤不漲過幅度%");
input:TXT1("僅適用日線"); setinputname(3,"使用限制");
input:TXT2("須逐筆洗價"); setinputname(4,"使用說明");
settotalbar(3);
if BarFreq <> "D"  or currenttime > 90500 then return;

   
value1=GetField("Stotalbuy")[1];//投信買張
value2=GetField("Ssharesheldratio")[1];//投信持股比例
if value2<Ratio and value1/volume[1]>0.1 and close < close[1] *(1 + Gap * 0.01)
then ret=1;     