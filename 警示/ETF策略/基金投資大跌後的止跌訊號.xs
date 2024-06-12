{@type:sensor}
if (open[2] - close[2] ) > (high[2] -low[2]) * 0.75
//前前期出黑K棒
and close[2] < close[3]-(high[3]-low[3])
//跌勢擴大
and ( close - open ) > (high -low) * 0.75
//當期收紅K棒
and close> close[2]					
//收復黑棒收盤價
and close[1] <= close[2] and close[1] < open
//前低收盤為三期低點
and close[40] > close[1]*1.05
//近四十日跌幅超過5%
then ret=1;

