{@type:sensor}
input:Length(20); setinputname(1,"計算期數");
input:Ratio(0.5); setinputname(2,"突破幅度%");
input:RRatio(1.5); setinputname(3,"盤整區間幅度%");
input:TXT1("僅適用5分鐘線"); setinputname(4,"使用限制");

settotalbar(3);
setbarback(Length);

if barfreq<> "Min" or barinterval <> 5 then return;

variable: RangeHigh(0);
variable: RangeLow(0);
RangeHigh=highest(close[1],length);
RangeLow=lowest(close[1],length);

if Close > RangeHigh*(1+Ratio/100) then
   if RangeHigh <  RangeLow * (1+ RRatio/100) then ret=1;
