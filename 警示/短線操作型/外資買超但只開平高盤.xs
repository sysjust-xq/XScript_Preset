{@type:sensor|@guid:2736b98a2f9a4627a852ba90b3d9f6e3|@path:/短線操作型/外資買超但只開平高盤}
input: Atleast(1000); setinputname(1,"外資買超張數");
input: Gap(2); setinputname(2,"平盤幅度%");
input:TXT1("僅適用日線"); setinputname(3,"使用限制");
input:TXT2("需逐筆洗價"); setinputname(4,"使用說明:選日內單次觸發");

settotalbar(3);

if BarFreq = "D" and  Getfield("外資買賣超")[1] > Atleast and
   GetField("Open", "D") < GetField("RefPrice", "D") *(1+Gap/100) and
   GetField("Open", "D") > GetField("RefPrice", "D") 
then ret=1;

