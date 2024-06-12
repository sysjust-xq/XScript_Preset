{@type:filter}
input:r1(10);	setinputname(1,"PB距離N個月來低點只剩N%");
input:r2(60);	setinputname(2,"N個月以來");
//input:TXT("僅適用月資料"); setinputname(3,"使用限制");
setbarfreq("M");

if barfreq <> "M" then raiseruntimeerror("頻率錯誤");

settotalbar(3);

value1=GetField("股價淨值比","M");
value2=lowest(GetField("股價淨值比","M"),r2);
value3=average(GetField("股價淨值比","M"),r2);

if value1 < value3 and value1 < value2*(1+r1/100)
then ret=1;

setoutputname1("股價淨值比");
outputfield1(value1);
