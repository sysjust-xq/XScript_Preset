{@type:sensor|@guid:3f2088b848614730abba72bed9562b8c|@path:/2.市場常用語/資減券增|@hash:bbdf129e2122c431625d2cba9896a0f1}
input:x1(300);setinputname(1,"融資減少張");
input:x2(200);setinputname(2,"融券增加張");
input:x3(10); setinputname(3,"全計佔成交量比例%");
input: Type(1); setinputname(4,"最新資料：0=今日、1=昨日");
input: TXT1("僅適用日線"); setinputname(5,"使用限制");
input: TXT2("盤中無當日資券資料"); setinputname(6,"建議使用單次洗價模式");

settotalbar(3);

value1=GetField("融資增減張數")[Type];//融資增減張數
value2=GetField("融券增減張數")[Type];//融券增減張數

 if value1 <-x1 and 
    value2 > x2 and 
    (value2-value1)/volume[Type]>x3/100
 then ret=1;