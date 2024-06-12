{@type:filter}
Value1=linearregslope(close,3);
value2=linearregslope(close,5);
value3=linearregslope(close,20);

settotalbar(23);

if 
	value1 > value2 and 
	value2 > value3 and 
	value1 > value1[1] and 
	value1[1] > value1[2] and 
	value1 > 0.3 and 
	value3[2] < 0.1 and 
	value3 > 0
then ret=1;