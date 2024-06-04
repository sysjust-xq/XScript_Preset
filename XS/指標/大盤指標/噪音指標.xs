{@type:indicator|@guid:f8e712453565402da77bf205eccbdbf2|@path:/大盤指標/噪音指標|@hash:cc2762e8bfdd84186ee3ef783a0188bd}

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
  