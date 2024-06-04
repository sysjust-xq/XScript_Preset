{@type:indicator|@guid:56f5a51282bc4e8fabda8877b365b33c|@path:/技術指標/CMO(錢德動量擺盪指標)|@hash:9318f4914761c279433b08393552a059}
Input:length(10);   setinputname(1, "天期");

variable: SU(0),SD(0);   

if close >= close[1] then   
  SU = CLOSE - CLOSE[1]   
else   
  SU = 0;   

if close < close[1] then   
  SD = CLOSE[1] - CLOSE   
else   
  SD = 0;    

value1 = summation(SU,length);   
value2 = summation(SD,length);   
if value1+value2 <> 0 then value3 = (value1-value2)/(value1+value2)*100;
plot1(value3, "CMO");
  