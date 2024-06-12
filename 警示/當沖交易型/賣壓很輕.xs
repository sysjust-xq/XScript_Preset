{@type:sensor}
input:rate(20);setinputname(1,"當日內盤量佔總成交比例%");
settotalbar(8);
if {內盤量}GetField("內盤量", "D")  < GetField("Volume", "D")*(Rate/100)  and Countif(close< close[1],5) < 3
then ret=1;