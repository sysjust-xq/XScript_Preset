{@type:filter|@guid:17b4288717e04c7c88c2f0519a4f85d2|@path:/04.價量選股/盤整N日後突破}
input:period(20,"盤整的天數");
input:ratio(5,"盤整的最大波動範圍");

if highest(close,period)[1]<lowest(close,period)[1]*(1+ratio/100)
and close > highest(close,period)[1]
and volume >average(volume,period)
and volume>2000
then ret=1;