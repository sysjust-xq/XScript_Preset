{@type:filter}
SetTotalBar(8);

value1 = (average(close,30) + average(close,72)) / 2;	//地心引力線
value2 = value1*1.2;//高壓電線
value3 = linearregslope(value2,5);

if absvalue(value3) <= 0.1 and close crosses under value1
then ret=1;

