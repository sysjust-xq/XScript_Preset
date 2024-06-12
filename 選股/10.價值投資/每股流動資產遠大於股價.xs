{@type:filter}
input:percent(20);
setinputname(1,"每股易變現資產與股價間的落差比");
value1=GetField("現金及約當現金","Q");//百萬;
value2=GetField("短期投資","Q");//百萬
value3=GetField("應收帳款及票據","Q");//百萬
value4=GetField("長期投資","Q");//百萬
value5=GetField("負債總額","Q");//百萬
value6=GetField("最新股本");//單位: 億
value7=(value1+value2+value3+value4-value5)/(value6*10);
if value7>close*(1+percent/100)
then ret=1;
