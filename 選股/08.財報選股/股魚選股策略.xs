{@type:filter}
value1=GetField("營業利益","Q");//單位百萬
value2=GetField("稅前淨利","Q");//單位百萬
value3=GetField("來自營運之現金流量","Q");//單位百萬
value4=GetField("資本支出金額","Q");//單位百萬
value5=GetField("利息支出","Q");//單位百萬
value6=GetField("所得稅費用","Q");//單位百萬
condition1=false;
condition2=false;
condition3=false;

if value2>0 then begin
	if value1/value2*100>80
	then condition1=true;  //本業獲利佔八成以上
end;

if value3-value4-value5-value6>0 //自由現金流量大於零
then condition2=true;

value7=GetField("利息保障倍數","Y");
value8=GetField("股東權益報酬率","Y");//單位%
value9=GetField("營業利益率","Q");//單位%
value10=GetField("本益比","D");
value11=GetField("殖利率","D");
value12=GetField("每股淨值(元)","Q");
value13=value12*value8/8;//獲利能力比率

if value7>20 and value8>8 and value9>0 and value10<12 and value11>6 and close<value13
then condition3=true;

if condition1 and condition2 and condition3
then ret=1;

outputfield(1,GetField("股東權益報酬率","Y"),2,"ROE");
outputfield(2,GetField("殖利率","D"),2,"殖利率", order := 1);
