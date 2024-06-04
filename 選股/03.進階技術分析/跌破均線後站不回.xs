{@type:filter|@guid:36a724a88f884a028ff2d62093fa2bb5|@path:/03.進階技術分析/跌破均線後站不回}
input:day(3);			setinputname(1,"幾天內未站回");
input:length(20);		setinputname(2,"移動平均線期別");

settotalbar(length + 3);

if close[day-1] crosses under average(close[day-1], length) then
  begin
	variable: keyprice(0);
	
	keyprice = average(close[day-1], length);
	if trueall(close < keyprice, day-1) then ret = 1;
  end;
  
  

