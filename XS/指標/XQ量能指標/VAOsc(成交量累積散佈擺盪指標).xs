{@type:indicator|@guid:bc4d67fdb05d489da908cdc04e26ccca|@path:/XQ量能指標/VAOsc(成交量累積散佈擺盪指標)|@hash:e9224005d8b3ab1ba4e9be64f106d267}
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
		