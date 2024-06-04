{@type:sensor|@guid:697cad294b6c4502839b9fdad247316d|@path:/波段操作型/SAR買進訊號|@hash:08378a59e69ddc183df18c193b85f603}
input:AFIncrement(0.02);  setinputname(1,"加速因子");
input:AFMax(0.2);  setinputname(2,"加速因子最大值");

settotalbar(100);

variable:
	sarValue(0);
	
sarValue = SAR(AFIncrement, AFIncrement, AFMax);	

if close crosses over sarValue then ret = 1;
