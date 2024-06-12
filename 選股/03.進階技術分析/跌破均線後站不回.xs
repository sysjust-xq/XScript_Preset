{@type:filter}
input:day(3);			setinputname(1,"幾天內未站回");
input:length(20);		setinputname(2,"移動平均線期別");

settotalbar(length + 3);

if close[day-1] crosses under average(close[day-1], length) then
  begin
	variable: keyprice(0);
	
	keyprice = average(close[day-1], length);
	if trueall(close < keyprice, day-1) then ret = 1;
  end;
  
  

