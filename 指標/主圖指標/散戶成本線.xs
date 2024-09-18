{@type:indicator}
{散戶成本線內有兩個線圖, 可以分開勾選, 
一個是散戶買進成本線, 計算方式都是累計當日小單的買進金額/買進量
一個是散戶賣出成本線, 計算方式都是累計當日小單的賣出金額/買進量
支援商品：台股}

value91 = GetField("買進小單金額");

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");
	
//買進成本
value1 = GetField("買進小單金額","D");
value2 = GetField("買進小單量","D");
if value2 <> 0 then
	value3 = value1 / (value2*1000)
else
	value3 = value3[1];

//賣出成本
value11 = GetField("賣出小單金額","D");
value21 = GetField("賣出小單量","D");
if value21 <> 0 then 
	value31 = value11 / (value21*1000)
else
	value31 = value31[1];

plot1(value3,"散戶買進成本線",checkbox:=1);
plot2(value31,"散戶賣出成本線",checkbox:=1);