{@type:indicator}
input:		
	AFInitial(0.02, "加速因子起始值"), 
	AFIncrement(0.02, "加速因子累加值"), 
	AFMax(0.2, "加速因子最高值");

plot1(SAR(AFInitial, AFIncrement, AFMax), "SAR");