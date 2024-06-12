{@type:filter}
input: lowlimit(10,"償債後現金及短投最少金額");

value1=GetField("現金及約當現金","Q");//單位百萬
value2=GetField("短期投資","Q");//單位百萬
value3=GetField("短期借款","Q");//單位百萬
value4=(value1+value2-value3)/100;//單位億之現金及短期投資合計金額

if value4>=lowlimit
then ret=1;

outputfield(1,value4,"償債後現金及短投金額(億)");
