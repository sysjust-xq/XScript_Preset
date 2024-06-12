{@type:indicator}
{
指標說明
https://xstrader.net/918/
}

value1 = 100*(average(H/L-1,20)+standarddev(H/L-1,20,1)*3);
value2 = value1- average(value1,10);

plot1(value1,"波動指標");
if value2> 0 then plot2(value2,"波動放大");
if value2<= 0 then plot3(value2,"波動縮小");