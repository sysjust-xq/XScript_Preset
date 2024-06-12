{@type:sensor}
input:period(10,"計算天數");
input:times(5,"背離次數");

if close[1]*1.2<close[40] //大跌
and countif(c>c[1] xor v>v[1],period) >= times //價漲量縮、價跌量增
and close=highest(close,period) //收近期最高
then ret=1;