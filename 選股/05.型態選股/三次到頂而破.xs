{@type:filter}
input: BoxRangePercents(7); setinputname(1,"定義整理區間幅度");
input: HighAreaPercents(1.5); setinputname(2,"定義區間高檔範圍");
variable: BoxHigh(0);

variable:period(10),MaxPeriod(40);

period = 10;
while period < Maxperiod and
	highest(high[1],period) < lowest(low[1],period) *(1+BoxRangePercents/100)
begin period +=1; end;

if period < MaxPeriod then
begin
	BoxHigh = highest(High[1],period); {區間高點}

	if Close > BoxHigh   and  {突破整理區間高點}
	   NthHighest(3,High[1],period) > BoxHigh*(1-HighAreaPercents/100)
	   {昨天以前第3個高點也在高檔區間,即曾經攻高3次}
	   then ret=1;
end;
   