{@type:sensor|@guid:7ed64565af044cc1b368a9bd0fac16df|@path:/2.市場常用語/急拉|@hash:2149493bc9f7a76fe575f3bc3652b90f}
input:P1(1.5); setinputname(1,"急拉幅度%");

settotalbar(3);

IF close > close[1]*(1+P1/100)  and close=high and volume>volume[1]
then ret=1;