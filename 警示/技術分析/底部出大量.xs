{@type:sensor|@guid:36bb588f2f744b40b7686f9de7ec5fb4|@path:/技術分析/底部出大量}
input:period(60);
if close=lowest(close,period)
and volume=highest(volume,period)
then ret=1;

