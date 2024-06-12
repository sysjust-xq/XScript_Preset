{@type:sensor}

condition1=false;
condition2=false;
condition3=false;
if high<= maxlist(open, close)*1.01	
//條件1:小紅小黑且上影線很小
then condition1=true;
if (close-low)> (open-close)*2 and (close-low)>close*0.02
//條件2:下影線為實體兩倍以上
then condition2=true;
if highest(high,30)>close[1]*1.4
//條件3:近30日來最高點到昨天跌幅超過40%
then condition3=true;
{結果判斷}		
IF		condition1
	and	condition2
	and	condition3
and average(volume,100)>1000
//只計算有量的股票
then ret=1;	
