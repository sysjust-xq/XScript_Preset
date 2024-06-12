{@type:sensor}
input:initialtime(090000); setinputname(1,"起算時間HHmmss");
input:timeline(100000);   setinputname(2,"截止時間HHmmss");
input:CloseAtHigh(false); setinputname(3,"收盤價亦須創新高");
input:TXT1("限用分鐘線"); setinputname(4,"使用限制");

settotalbar(50);

if barfreq<> "Min" then return;
variable: intervalhigh(0);

if date <> date[1] then  intervalhigh = 0; 

if time >= initialtime and time <= timeline then 
begin
  intervalhigh = maxlist(high,intervalhigh);
end;

if time > timeline then
begin
  if CloseAtHigh then  
    Ret = IFF(close > intervalhigh, 1, 0)
  else  
    Ret = IFF(high > intervalhigh, 1, 0); 
end;