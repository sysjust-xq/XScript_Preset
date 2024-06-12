{@type:filter}
setbarfreq("M");

value1=average(GetField("月營收年增率","M"),3);
//月營收年增率三個月平均
value2=average(GetField("月營收年增率","M"),12);
//月營收年增率十二個月平均
if value1 crosses over value2
//黃金交叉
and value1>5
and value1-value2>5
and value2>=1
then ret=1;
outputfield(1,value1,0,"3個月平均");
outputfield(2,value2,0,"12個月平均");
outputfield(3,(close-close[1])/close[1]*100,1,"本月漲跌幅");