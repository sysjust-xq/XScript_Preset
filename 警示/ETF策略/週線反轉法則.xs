{@type:sensor}
input:rate1(5,"先前週線漲幅");
input:rate2(3,"本週低點跌幅");
input:TXT("僅適用日線","使用限制");

settotalbar(20);

if getfield("high","W")[2]>=getfield("close","W")[3]*(1+rate1/100) 
and low < getfield("close","W")[1]*(1-rate2/100)
then ret=1;
