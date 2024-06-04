{@type:filter|@guid:33e26c779fc64dc7a877ecf813efab9d|@path:/05.型態選股/突破股票箱}
input:length(12);		setinputname(1, "股票箱區間長度");
input:boxrange(10);		setinputname(2, "箱區高低範圍(%)");
	
settotalbar(3);	
	
value1=NthHighest(1,high,length);
value3=nthhighest(3,high,length);
value4=Nthlowest(1,low,length);
value5=nthlowest(3,low,length);

if 
  value1[1] <= 1.03 * value3[1] and 
  value5[1] <= 1.03 * value4[1] and 
  value1[1] <= (1 + 0.01 * boxrange) * value4[1] and 
  close > value1[1]
then ret=1;

