{@type:sensor}
input:initialtime(090000); setinputname(1,"起算時間HHmmss");
input:timeline(100000);   setinputname(2,"截止時間HHmmss");
input:CloseAtLow(false); setinputname(3,"收盤價亦須創新低");
input:TXT1("限用分鐘線"); setinputname(4,"使用限制");

settotalbar(50);

if barfreq<> "Min" then return;

variable: intervallow(99999999);

if date <> date[1] then intervallow = 99999999;

if time >= initialtime and time <= timeline then 
begin
  intervallow = minlist(low,intervallow);
end;

if time >timeline then
begin
  if CloseAtLow  then  
	Ret = IFF(close < intervallow, 1, 0)
  else  
	Ret = IFF(low < intervallow, 1, 0);
end;