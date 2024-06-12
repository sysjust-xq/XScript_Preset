{@type:indicator}
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
  