{@type:filter}
input:ratio(10,"毛利率單季衰退幅度上限");
input:period1(10,"計算的期間，單位是季");
input:period2(5,"計算的季別");
input:count(2,"符合條件之最低次數");
setbarfreq("Q");
settotalbar(maxlist(period1,period2)+1);

value1=GetField("營業毛利率","Q");
value2=GetField("營業收入淨額","Q");//單位百萬
value3=GetField("營業費用","Q");//單位百萬

if trueall(value1>value1[1]*(1-ratio/100),period1)
and countif(value2>value2[1]and value3<value3[1],period2)>=count
then ret=1;