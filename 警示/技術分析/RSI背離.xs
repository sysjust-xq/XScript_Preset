{@type:sensor}
value1=rsi(close,12);
if linearregslope(close,6)<0
and linearregslope(value1,6)>0
and close*1.2<close[20]
then ret=1;