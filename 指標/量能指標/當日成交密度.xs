{@type:indicator}
variable:II(0);

if high-low<>0 and volume<>0 then 
	II=(2*CLOSE-HIGH-LOW)/(HIGH-LOW)*VOLUME;

PLOT1(average(II,5),"成交密度");
