{@type:sensor|@guid:598eaea449334fd0ad6724e642e9dfdb|@path:/波段操作型/沖擊底部|@hash:043ff7a965ffd80d6852b08d7cceb273}
input:BarPercent(75); setinputname(1,"當期回升比例");

settotalbar(3);

if q_Ask > Close[1] and high[1] > high[2] and low[1] > low[2] and close[1] > close[2] then
  if TrueAll( (close[1]-low[1])>(high[1]-low[1])*BarPercent/100 ,2) then ret=1;
