{@type:indicator|@guid:a0d11323d0cd4fd48745c0f4e7397809|@path:/量能指標/當日成交密度|@hash:477f42222b30907094032cd06b9e1dfa}
variable:II(0);

if high-low<>0 and volume<>0 then 
	II=(2*CLOSE-HIGH-LOW)/(HIGH-LOW)*VOLUME;

PLOT1(average(II,5),"成交密度");
