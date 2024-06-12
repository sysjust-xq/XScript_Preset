{@type:indicator}
input:length(20,"期數");

variable:count(0);
variable:x1(0);

count=countif(close>close[1],length);

plot1(count,"上漲天數");