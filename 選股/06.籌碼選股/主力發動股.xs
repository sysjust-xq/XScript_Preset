{@type:filter}
//成交量 連續 3 日遞減
//股價 > 20日均線 10%

if volume<volume[1] 
and volume[1]<volume[2]
and close>average(close,20)*1.1
then ret=1;