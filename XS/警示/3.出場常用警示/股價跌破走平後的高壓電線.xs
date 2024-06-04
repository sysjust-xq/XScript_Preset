{@type:sensor|@guid:1b52d1a623d647d78b0ef86ee4a9cc41|@path:/3.出場常用警示/股價跌破走平後的高壓電線|@hash:e7a64d531231abd4f5029c6bf3c41937}
input:Ratio(10); setinputname(1,"高壓電線幅度%");
input:Length(5); setinputname(2,"計算走平期數");

settotalbar(Length + 8);
setbarback(72);

variable: Factor(0);Factor = 100/Close;

if absvalue(linearregslope(avgprice[1]*Factor,Length))<=0.1 and  //走平
   close crosses under ((average(close,30)+average(close,72))/2 )* (1+Ratio*0.01) 
then ret=1;