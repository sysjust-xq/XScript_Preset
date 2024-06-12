{@type:filter}
value1=summation(GetField("本期稅後淨利","Q"),4);//單位:百萬
value2=GetField("負債總額","Q");
value3=GetField("資產總額","Q");
value4=GetField("總市值","D");//單位:億

if value4<value1*7/100
and value3>value2*2
then ret=1;

outputfield(1,value1/100,0,"近四季獲利(億)");
outputfield(2,value1/100*7,0,"獲利的七倍(億)");
outputfield(3,value4,0,"總市值");
outputfield(4,value2,0,"負債");
outputfield(5,value3,0,"資產");