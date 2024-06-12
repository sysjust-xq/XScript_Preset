{@type:sensor}
input:Length(20); setinputname(1,"設定波段天數");
input:P1(2); setinputname(2,"設定高檔壓回百分比");
input:P2(0.5); setinputname(3,"當日開高基準百分比");
input:P3(0.5); setinputname(4,"上影線佔價格幅度%");
input:TXT("建議使用日線"); setinputname(5,"使用說明");

settotalbar(3);
setbarback(Length);

if  open - close[1] <P2/100*close[1]  and
    high[1]=highest(high,Length)  and 
	(high[1]-close[1])>= P1/100 *close[1] and
	high[1] > maxlist(open[1], close[1]) *(1+P3/100)
then  ret=1;
