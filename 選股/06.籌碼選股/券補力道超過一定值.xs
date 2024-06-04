{@type:filter|@guid:fc8148ba28de4e7d9e3be60cc41a3113|@path:/06.籌碼選股/券補力道超過一定值}
value1=GetField("融券餘額張數","D");
input:lowlimit(100,"券補力道下限");
if value1/average(volume,5)*100>lowlimit
then ret=1;