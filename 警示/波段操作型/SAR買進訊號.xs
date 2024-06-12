{@type:sensor}
input:AFIncrement(0.02);  setinputname(1,"加速因子");
input:AFMax(0.2);  setinputname(2,"加速因子最大值");

settotalbar(100);

variable:
	sarValue(0);
	
sarValue = SAR(AFIncrement, AFIncrement, AFMax);	

if close crosses over sarValue then ret = 1;
