{@type:filter}
input:limit1(7);		setinputname(1,"定義整理的區間幅度");
input:limit2(2);		setinputname(2,"定義三個頂點間的差距");
input:rangemax(30);		setinputname(3,"整理區間最長日期限制");
input:vollimit(500);	setinputname(4,"突破時成交量最小值");

variable: period(0);

SetTotalBar(rangemax + 3);

period = 5;
repeat
 begin
	value1=simplehighest(high[1],period);
	value2=simplelowest(low[1],period);
	period=period+1;
 end;	
until period >= rangemax or (value1 > value2 * (1 + limit1/100));

if period < rangemax
then
  begin
	value3=nthhighest(1, high[1], period);
	value4=nthhighest(3, high[1], period);

	if value3 <= value4 * (1 + limit2/100) and 
	   close crosses over value3 and
	   volume > vollimit
	then ret=1;
  end;
  



