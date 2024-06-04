{@type:sensor|@guid:488746428b3542e99048b2f4ba687c51|@path:/價量指標/當日時段區間價跌破|@hash:3205165d72a6109e807a5ed242b9a510}
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