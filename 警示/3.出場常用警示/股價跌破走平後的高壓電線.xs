{@type:sensor}
input:Ratio(10); setinputname(1,"高壓電線幅度%");
input:Length(5); setinputname(2,"計算走平期數");

settotalbar(Length + 8);
setbarback(72);

variable: Factor(0);Factor = 100/Close;

if absvalue(linearregslope(avgprice[1]*Factor,Length))<=0.1 and  //走平
   close crosses under ((average(close,30)+average(close,72))/2 )* (1+Ratio*0.01) 
then ret=1;