{@type:sensor|@guid:d2b103ead3474db88764e429e0875e44|@path:/ETF策略/ETF乖離反轉作多買進訊號}
input:Length(20); setinputname(1,"計算期數");
input:Ratio(21); setinputname(2,"乖離%");

variable:KPrice(0);
if close/average(close,Length)<= 1-Ratio/100 then KPrice = H;
if Close crosses over KPrice
then ret=1 ;
