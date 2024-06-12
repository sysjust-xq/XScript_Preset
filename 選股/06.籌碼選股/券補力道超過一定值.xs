{@type:filter}
value1=GetField("融券餘額張數","D");
input:lowlimit(100,"券補力道下限");
if value1/average(volume,5)*100>lowlimit
then ret=1;