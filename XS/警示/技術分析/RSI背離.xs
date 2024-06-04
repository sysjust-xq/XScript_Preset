{@type:sensor|@guid:56a2bdfee21641369c7290530026ae77|@path:/技術分析/RSI背離}
value1=rsi(close,12);
if linearregslope(close,6)<0
and linearregslope(value1,6)>0
and close*1.2<close[20]
then ret=1;