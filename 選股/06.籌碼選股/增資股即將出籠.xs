{@type:filter}
setbarfreq("AD");

value1=GetField("現增新股上市日");
value2=GetField("現增比率");//每千股可認股數
value3=GetField("現增價格");
value4=GetField("融券餘額張數","D");
value5=GetField("普通股股本","Q");//單位:億

if value1>date and datediff(value1,date)<10//增資股快上市了
and value5*10000*value2/1000>2000//增資張數大於5000張
and value4[30]>value4-1000//近一個月融券增加沒有超過1000張
and value3*1.1<close//股價仍比現增價格高超過一成
then ret=1;

outputfield(1,value1,0,"新股上市日", order := -1);
outputfield(2,value2,2,"現增比率");
outputfield(3,close-value3,2,"現增價差");
