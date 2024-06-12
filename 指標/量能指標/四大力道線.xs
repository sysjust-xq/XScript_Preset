{@type:indicator}
{
指標說明
https://xstrader.net/改良版的移動平均線四大力道線/
}

input:period(10,"天期參數");

value1=summation(high-close,period);//上檔賣壓
value2=summation(close-open,period); //多空實績
value3=summation(close-low,period);//下檔支撐
value4=summation(open-close[1],period);//隔夜力道
if close<>0 then
	value5=(value2+value3+value4-value1)/close;

plot1(value5,"四大力道線");

