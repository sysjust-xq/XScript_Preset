{@type:sensor}
input:BarPercent(75); setinputname(1,"當期回升比例");

settotalbar(3);

if q_Ask > Close[1] and high[1] > high[2] and low[1] > low[2] and close[1] > close[2] then
  if TrueAll( (close[1]-low[1])>(high[1]-low[1])*BarPercent/100 ,2) then ret=1;
