{@type:indicator|@guid:8cb5ce7a83ad4416abe1a65741371ef2|@path:/主圖指標/平均波幅通道|@hash:602f5cab0238fb875ded6b91fc61d2e5}
input : length(5);			setinputname(1, "天期");
input : atrlength(15);		setinputname(2, "ATR天期");
input : k(1.35);			setinputname(3, "通道常數");
  
variable : hband(0),lband(0);  
       
hband = average(close,length)+average(truerange,atrlength)*k;  
lband = average(close,length)-average(truerange,atrlength)*k;  
       
plot1(hband, "通道上限");  
plot2(lband, "通道下限");   

