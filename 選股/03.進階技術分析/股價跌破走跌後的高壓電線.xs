{@type:filter|@guid:114be2370e9a4967a64711645de0a0ae|@path:/03.進階技術分析/股價跌破走跌後的高壓電線}
SetTotalBar(8);

value1 = (average(close,30) + average(close,72)) / 2;	//地心引力線
value2 = value1*1.2;//高壓電線
value3 = linearregslope(value2,5);

if absvalue(value3) <= 0.1 and close crosses under value1
then ret=1;

