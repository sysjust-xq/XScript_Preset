{@type:filter}
setbarfreq("AD");

input: Periods(150,"計算期數");
input: Ratio(20,"期間漲幅%");

if close < close[4]
and close*1.1>highest(close,periods)
//離最高不到一成
and close >= close[Periods] *(1 + Ratio*0.01)
//過去半年漲幅超過五成
and average(volume[1],5)*1.5 < average(volume[1],20)
//最近幾天成交量大幅縮小
then ret=1;

outputfield(1,highest(close,periods),2,"波段高點", order := -1);
