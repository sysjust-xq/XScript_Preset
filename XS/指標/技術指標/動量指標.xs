{@type:indicator|@guid:6c765043d442444ca3e7f410126ad932|@path:/技術指標/動量指標|@hash:267ea8af2f6ca7b3405d4f3cebc10f41}
{
指標說明
https://xstrader.net/尋找趨勢是否成形的指標動量指標/
}

if barfreq = "Tick" or barfreq = "Min" then
begin
	value1=GetField("內盤量");//單位:元
	value2=GetField("外盤量");//單位:元
end else begin
	value1=GetField("內盤量","D");//單位:元
	value2=GetField("外盤量","D");//單位:元
end;
value3=(high+low)/2;//計算當天波動的平均價位
//質量就是內外盤差乘均價
if value2>value1 then
	value4=value3*(value2-value1)
else
	value4=value3*(value1-value2);
if close>=close[1] then begin //(方向是往上)
	value5=(close-close[1])/close[1]*value4;//質量乘以速度
	value6=0;
end else begin//(方向是往下)
	value5=0;
	value6=(close[1]-close)/close[1]*value4;
end;
value8=average(value5,2);
value9=average(value6,2);
value10=value8-value9;

plot1(value10,"動能差");






