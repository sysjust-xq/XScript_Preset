{@type:filter|@guid:f522c27327ff4aeb93a467b2b2628b70|@path:/04.價量選股/漲多後跌破頭部}
input:ratio(50);
input:period(100);
setinputname(1,"波段漲幅");
condition1=false;
value1=highestbar(close,period);//波段最高價距今幾根bar
value2=lowest(close[1],value1);
if value1>5 and close>close[100]*(1+ratio/100)
and close crosses under value2
then ret=1;