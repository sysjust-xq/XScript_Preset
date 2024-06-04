{@type:sensor|@guid:9113368ca435434786baa76d3503173b|@path:/2.市場常用語/急殺|@hash:3311163bfc2728ed1127276de09565e0}
input:P1(1.5); setinputname(1,"急殺幅度%");

settotalbar(3);

IF close < close[1]*(1-P1/100)  and close=Low and volume>volume[1]
then ret=1;