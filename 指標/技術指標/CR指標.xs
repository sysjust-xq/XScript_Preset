{@type:indicator}
input:Length(26,"N日累積");
variable:Upsum(0),Downsum(0),CR(0); 
 
Upsum =  summation(high - WeightedClose[1],Length);
Downsum = summation(WeightedClose[1] - low,Length); 
 
if Downsum <> 0 then
	CR = Upsum / Downsum *100
else
	CR = CR[1]; 
 
plot1(CR,"CR(%)");