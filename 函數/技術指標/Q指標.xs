{@type:function}
SetBarMode(2);

input:t1(numericsimple,"天期");
input:t2(numericsimple,"平均天期");
input:t3(numericsimple,"雜訊平滑天期");
variable:Qindicator(0);

value1=close-close[1];			//價格變化
value2=summation(value1,t1);	//累積價格變化
value3=average(value2,t2);
value4=absvalue(value2-value3);	//雜訊
value5=average(value4,t3);		//把雜訊移動平均


if value5 = 0 then 
	Qindicator = 0
else
	Qindicator = value3 / value5*5;

ret = Qindicator;


