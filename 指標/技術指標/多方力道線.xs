{@type:indicator}
input:
	period1(10,"計算期數"),
	period2(5,"平滑期數");

value1=summation(high-close,period1);//上檔賣壓
value2=summation(close-open,period1); //多空實績
value3=summation(close-low,period1);//下檔支撐
value4=summation(open-close[1],period1);//隔夜力道
if close<>0 then
	value5=(value2+value3+value4-value1)/close;
value6=average(value5,period2);

plot1(value6,"多方力道");
