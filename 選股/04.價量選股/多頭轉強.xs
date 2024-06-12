{@type:filter}
setbarfreq("AD");

input:length(10, "天期");
variable: sumUp(0), sumDown(0), up(0), down(0),RS(0);

if CurrentBar = 1 then  begin
    sumUp = Average(maxlist(close - close[1], 0), length);
    sumDown = Average(maxlist(close[1] - close, 0), length);
end else begin
	up = maxlist(close - close[1], 0);
	down = maxlist(close[1] - close, 0);
    sumUp = sumUp[1] + (up - sumUp[1]) / length;
	sumDown = sumDown[1] + (down - sumDown[1]) / length;
end;

if sumdown<>0
then rs=sumup/sumdown;

if rs crosses over 4
and close<close[3]*1.06
//最近3日漲幅小於6%
and Average(Volume[1], 100) >= 500
//成交量判斷
then ret=1;

outputfield(1, nthlowest(1,low[1],length), 2, "區間低點", order := -1);





 