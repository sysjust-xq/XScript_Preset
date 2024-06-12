{@type:filter}
value1=GetField("現金及約當現金","Q");//單位百萬
value2=GetField("短期投資","Q");//單位百萬
value3=(value1+value2)/100;//單位億之現金及短期投資合計金額
value4=GetField("總市值","D");//單位:億
if value4<>0
then value5=value3/value4;//現金總市值比;
if value5>0.7 and value3>3 //現金總市值比大於0.7且現金及短投合計超過3億
then ret=1;

outputfield(1, value5, 1, "現金總市值比", order := 1);
