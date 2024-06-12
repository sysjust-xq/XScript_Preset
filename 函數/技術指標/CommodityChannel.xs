{@type:function}
SetBarMode(2);

// CommodityChannel function (for CCI指標)
//
input: length(numericsimple);                                                 
variable: avgtp(0);
variable: idx(0);
variable: sumDist(0);

avgtp = average(High + Low + Close, length);

sumDist = 0;
for idx = 0 to length - 1 
begin
	sumDist = sumDist + AbsValue(avgtp[idx] - (High + Low + Close)[idx]); 
end ;
sumDist = sumDist / length;

if sumDist <> 0 then
  CommodityChannel = (High + Low + Close - avgtp) / (0.015 * sumDist)
else
  CommodityChannel = 0;




