{@type:indicator}

input:length(10);		setinputname(1, "天期");   

variable:RWIH(0),RWIL(0);   

value1 = standarddev(close,length,1);   
value2 = average(truerange,length);   
RWIH = (high-low[length-1])/value2*value1;   
RWIL = (high[length-1]-low)/value2*value1;   

plot1(RWIH - RWIL, "RWI");
  