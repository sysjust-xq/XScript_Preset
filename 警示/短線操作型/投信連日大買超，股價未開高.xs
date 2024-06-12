{@type:sensor}
input:Periods(3); setinputname(1,"投信連續買超天數");
input:Atleast(10000); setinputname(2,"每日買超金額(萬元)");
input:Gap(1); setinputname(3,"開盤幅度%");
input:TXT1("僅適用日線"); setinputname(4,"使用限制");
input:TXT2("需逐筆洗價"); setinputname(5,"使用說明:選日內單次觸發");
settotalbar(Periods + 3);


if BarFreq = "D" and
   Trueall( Getfield("投信買賣超")[1]*Close*0.1 > Atleast ,Periods)  and
   GetField("Open", "D") < GetField("RefPrice", "D") *(1+Gap/100) 
then ret=1;
