{@type:indicator}
input:period(40,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("主力買張");
value2=(o+h+l+c)/4;

value3=value1*value2;//做多金額
 
if summation(value1,period)<>0 then
	value4=summation(value3,period)/summation(value1,period);
 
plot1(value4,"主力作多成本線");
 
