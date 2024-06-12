{@type:filter}
input:period(10,"計算區間");
input:ratio(10,"最低漲跌幅");

value1 = rateofchange(close,period-1);
if value1 < ratio then ret=1;

outputfield(1,value1,1,"區間漲跌幅");
