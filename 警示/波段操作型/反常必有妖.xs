{@type:sensor}
input:TXT("僅適用60分鐘"); setinputname(1,"使用限制");

settotalbar(30);

if barinterval <> 60  or barfreq<> "Min" then return;

if Close > close[1] * 1.02  then
begin
	value2=average(truerange,30);
	value3=average(truerange,3);
	if truerange>value3 and value3>value2 then ret=1;
end;