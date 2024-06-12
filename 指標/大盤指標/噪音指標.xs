{@type:indicator}

input:n1(5); setinputname(1,"計算天期");  
input:n2(5); setinputname(2,"移動平均天期");
  
value1=absvalue(close-close[n1-1]);  
value2=summation(range,n1);  
if value1 <> 0 then  
begin
	value3 = value2 / value1;  
	value4 = average(value3,n2);  
end;
  
plot1(value4,"噪音指標");
  