{@type:filter}
input:lowlimit(5,"年度獲利下限(億)");

value1=GetField("本期稅後淨利","Y");//單位:百萬
value2=lowest(value1,5);//五年獲利低點
value3=average(value1,5);//五年來平均獲利
if value1/100> lowlimit//獲利超過年度獲利下限
and value1/100<50//獲利沒有超過五十億元
and value1>value1[1]*0.9
and value1[1]>value1[2]*0.9//年度獲利連續兩年未衰退超過一成
and value2*1.3>value3
//五年來獲利最差的時候比平均值沒有掉超過三成

then ret=1;

outputfield(1, value1/100, 1, "稅後淨利(億)", order := 1);
