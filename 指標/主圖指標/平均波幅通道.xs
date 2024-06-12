{@type:indicator}
input : length(5);			setinputname(1, "天期");
input : atrlength(15);		setinputname(2, "ATR天期");
input : k(1.35);			setinputname(3, "通道常數");
  
variable : hband(0),lband(0);  
       
hband = average(close,length)+average(truerange,atrlength)*k;  
lband = average(close,length)-average(truerange,atrlength)*k;  
       
plot1(hband, "通道上限");  
plot2(lband, "通道下限");   

