{@type:sensor}
input:ratio(10,"近十日最小下跌幅度");

if open*1.025<close[1]//開盤重挫
and close>open //收盤比開盤高
and close*(1+ratio/100)<close[9]
//近十日跌幅超過N%
and low*1.01<open
//開低後又殺低
then ret=1;