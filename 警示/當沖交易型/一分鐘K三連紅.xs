{@type:sensor}
if barfreq <> "Min" or Barinterval <>1 then RaiseRuntimeError("請設定頻率為1分鐘");

variable:BarNumberOfToday(0); 

if Date <> Date[1] then 
	BarNumberOfToday=1
else 
	BarNumberOfToday+=1;{記錄今天的Bar數}
 
if barnumberoftoday=3 then begin
//今天第三根1分鐘K，也就是開盤第三分鐘
	if trueall(close>=close[1],3)
	//連三根K棒都是紅棒
	and volume>average(volume[1],3)*2
	//成交量是過去三根量平均量的兩倍以上
	and close=highd(0)
	//收最高
	then ret=1;
end;