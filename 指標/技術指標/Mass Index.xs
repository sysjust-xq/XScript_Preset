{@type:indicator|@guid:18ef2f43eadd462ca2a1b7932051d126|@path:/技術指標/Mass Index|@hash:e39e593b41903cb8bd85933889ce37af}
input: length1(9);	setinputname(1, "天期一");
input: length2(25); setinputname(2, "天期二");
  
value1 = average(range,length1);   
value2 = average(value1,length1);   
if value2 = 0 then value3 = 0 else value3 = value1/value2;
value4 = summation(value3,length2); 

plot1(value4,"Mass Index");    
