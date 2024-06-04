{@type:filter|@guid:40d1932417d7412c8249f89f2baa343c|@path:/04.價量選股/創百日來新高但距離低點不太遠}
//說明：今天的收盤價創百日來的收盤價新高，但是收盤價距離低點不太遠

input:day(100);			setinputname(1,"計算區間");
input:percents(14);		setinputname(2,"距離區間最低點漲幅");

SetTotalBar(3);

value1 = lowest(close, day);
if close=highest(close,day) and value1 * (1 + percents/100) >= close
then ret=1;