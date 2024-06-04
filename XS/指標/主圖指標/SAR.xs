{@type:indicator|@guid:438b01104b994078bb72150cc118a273|@path:/主圖指標/SAR|@hash:74cf80e5941d4278d21747c0ffe9632b}
input:		
	AFInitial(0.02, "加速因子起始值"), 
	AFIncrement(0.02, "加速因子累加值"), 
	AFMax(0.2, "加速因子最高值");

plot1(SAR(AFInitial, AFIncrement, AFMax), "SAR");