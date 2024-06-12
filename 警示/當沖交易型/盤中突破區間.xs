{@type:sensor}
input: timeline(100000); setinputname(1,"時間切算點");
input:TXT1("限用分鐘線"); setinputname(2,"使用限制");
input:TXT2("高點自開盤起算"); setinputname(3,"使用說明");
settotalbar(3);
if barfreq<> "Min" then return;
variable:RangeHigh(0);
if date <> date[1] then RangeHigh = 0;
if Time < timeline then RangeHigh = maxlist(RangeHigh,high)
	else if time >= timeline and  RangeHigh > 0 and Close > RangeHigh*1.005 then ret=1 ;
