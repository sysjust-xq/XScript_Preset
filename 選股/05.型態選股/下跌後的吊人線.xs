{@type:filter}
setbarfreq("AD");

condition1=false;
condition2=false;
condition3=false;

if high<= maxlist(open, close)*1.01	
//狀況1:小紅小黑且上影線很小
then condition1=true;

if (close-low)> absvalue(open-close)*2 and (close-low)>close*0.02
//狀況2:下影線為實體兩倍以上
then condition2=true;

if highest(high,30)>close[1]*1.4
//狀況3:近30日來最高點到昨天跌幅超過40%
then condition3=true;
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3

THEN	RET=1;	

outputfield(1,high,2,"K棒高點", order := -1);
