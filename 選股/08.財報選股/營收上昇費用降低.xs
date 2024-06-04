{@type:filter|@guid:906c238872b64297b0307cca16722da1|@path:/08.財報選股/營收上昇費用降低}
input:period(5,"計算的季別");
input:count(2,"符合條件之最低次數");
setbarfreq("Q");
settotalbar(period+1);

value1=GetField("營業收入淨額","Q");//單位百萬
value2=GetField("營業費用","Q");//單位百萬

if countif(value1>value1[1] and value2<value2[1],period)>=count
then ret=1;