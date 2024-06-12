{@type:filter}
input:b1(1.5,"三日漲幅上限");
if volume*close>=30000
and close<=close[2]*(1+b1/100)
then ret=1;