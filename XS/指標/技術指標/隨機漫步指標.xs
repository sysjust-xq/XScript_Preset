{@type:indicator|@guid:ff97b83867b0470d80466a0ee30b4fee|@path:/技術指標/隨機漫步指標|@hash:fda7356221bbab5b7a400da871b7e9f9}

input:length(10);		setinputname(1, "天期");   

variable:RWIH(0),RWIL(0);   

value1 = standarddev(close,length,1);   
value2 = average(truerange,length);   
RWIH = (high-low[length-1])/value2*value1;   
RWIL = (high[length-1]-low)/value2*value1;   

plot1(RWIH - RWIL, "RWI");
  