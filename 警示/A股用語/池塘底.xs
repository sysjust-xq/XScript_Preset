{@type:sensor}
input:Length(40); setinputname(1,"計算期數");
input:inter(10); setinputname(2,"選擇過去某一期");

settotalbar(8);
setbarback(maxlist(Length,inter));

value1=absvalue(close-close[inter]);
value2=value1/close;
value3=average(value2,length);//本日收盤價與前第inter日之收盤價之差的移動平均
value4=average(volume,20);

condition1 = value3<0.01;
condition2 =  close crosses above highest(high[1],length) ;
condition3 =  volume/value4>1.2;

if condition1 and condition2 and condition3 then ret=1;
