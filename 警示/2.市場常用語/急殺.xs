{@type:sensor}
input:P1(1.5); setinputname(1,"急殺幅度%");

settotalbar(3);

IF close < close[1]*(1-P1/100)  and close=Low and volume>volume[1]
then ret=1;