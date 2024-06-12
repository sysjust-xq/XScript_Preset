{@type:filter}
input:length(10);		setinputname(1,"計算區間");

settotalbar(length + 3);

value1 = average(close,length);
value2 = average(volume,length);
value3 = linearregslope(value1,length);
value4 = linearregslope(value2,length);

if value2 > 1000 and value3 < 0 and value4 > 0
then ret=1;

