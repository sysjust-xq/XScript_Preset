{@type:filter}
input:day(5);		setinputname(1,"幾天內未站回");
input:length(10);	setinputname(2,"移動平均線期別");
input:percent(20);	setinputname(3,"突破當日成交量超過均量多少%");

SetTotalBar(3);

value1=average(close,length);
value2=average(volume,length);

if close[day-1] crosses over average(close[day-1], length) and
   volume[day-1] > average(volume[day-1], length) * (1+percent/100) and
   volume > 1000
then
  begin
	variable: keyprice(0);
	
	keyprice = average(close[day-1], length);
	if trueall(close > keyprice, day-1) then ret = 1;
  end;
