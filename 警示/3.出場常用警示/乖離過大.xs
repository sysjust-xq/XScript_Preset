{@type:sensor}
input:Length(200); setinputname(1,"計算期數");
input:Ratio(70); setinputname(2,"正向乖離門檻%");

settotalbar(Length + 3);

if close/average(close,Length)>= 1+Ratio/100
then ret=1;