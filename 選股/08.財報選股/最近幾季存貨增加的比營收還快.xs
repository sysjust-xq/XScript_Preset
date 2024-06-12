{@type:filter}
input:r1(4 ,"存貨比營收成長率大的連續季數");
setbarfreq("Q");
settotalbar(r1+2);

value1=GetField("營業收入淨額","Q");
value2=GetField("存貨","Q");

value3=rateofchange(value1,1);
value4=rateofchange(value2,1);
value5=value4-value3;

if trueall(value5>0,r1)
and trueall(value5-value5[1]>0,r1)
then ret=1;
