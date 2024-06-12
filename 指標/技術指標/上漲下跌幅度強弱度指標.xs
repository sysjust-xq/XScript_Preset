{@type:indicator}
{
指標說明
https://xstrader.net/雲端策略中心精進版之34多頭轉強策略/
}

input:length(10,"期數"); 

variable: sumUp(0), sumDown(0), up(0), down(0),RS(0);

if CurrentBar = 1 then begin
	sumUp = Average(maxlist(close - close[1], 0), length); 
	sumDown = Average(maxlist(close[1] - close, 0), length); 
end else begin
	up = maxlist(close - close[1], 0);
	down = maxlist(close[1] - close, 0);	 
	sumUp = sumUp[1] + (up - sumUp[1]) / length;
	sumDown = sumDown[1] + (down - sumDown[1]) / length;
end;
if sumdown<>0 then rs=sumup/sumdown;

plot1(rs,"強弱度");