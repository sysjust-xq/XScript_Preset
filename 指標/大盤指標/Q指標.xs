{@type:indicator}
input:t1(10);	setinputname(1,"天期");
input:t2(5);	setinputname(2,"平均天期");
input:t3(20);	setinputname(3,"雜訊平滑天期");


value1=close-close[1];			//價格變化
value2=summation(value1,t1);	//累積價格變化
value3=average(value2,t2);
value4=absvalue(value2-value3);	//雜訊
value5=average(value4,t3);		//把雜訊移動平均

variable:Qindicator(0);
if value5 = 0 then 
	Qindicator = 0
else
	Qindicator = value3 / value5*5;
	
plot1(Qindicator,"Q-indicator");

