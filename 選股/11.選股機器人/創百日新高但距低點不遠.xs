{@type:filter|@guid:f6a602c6de4d439f9fc022517a33343d|@path:/11.選股機器人/創百日新高但距低點不遠}
//說明：今天的收盤價創百日的收盤價新高，但收盤價距離區間低點不遠

input:day(200,"計算區間");
input:day1(20,"短線漲幅計算區間");
input:percents(10,"距離區間最低點漲幅");

value1=lowest(close,day1);
if close=highest(close,day)
and value1*(1+percents/100)>=close
and close >= value1*1.05
and volume >= average(volume[1], 5)

then ret=1;

outputfield(1, value1, 2, "區間低點", order := -1);