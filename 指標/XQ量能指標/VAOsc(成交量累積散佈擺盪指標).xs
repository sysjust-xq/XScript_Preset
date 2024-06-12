{@type:indicator}
// XQ: VA-Osc指標
//
variable: support(0), resist(0), hlDiff(0), netSupportResist(0);
 
support = (Close - Low);
resist = (High - Close);
hlDiff = (High - Low);

if hlDiff = 0 then
	netSupportResist = 0
else
	netSupportResist = (support - resist) / hlDiff;
	
Plot1(netSupportResist * Volume, "VA-Osc");
		