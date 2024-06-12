{@type:sensor}
input:period2(4);  setinputname(1,"短期期數");
input:period1(12); setinputname(2,"長期期數");
input:ratio(2);    setinputname(3, "漲幅%");
input:TXT("建議使用5分鐘"); setinputname(4,"使用說明");

settotalbar(3);
setbarback(maxlist(period1,period2));

if close > close[1] * (1 + ratio*0.01) then 
begin
	value1=average(truerange,period1);
	value2=average(truerange,period2);
	if value1>value2 and value2 < close* 0.02 then ret=1;
end;