{@type:sensor|@guid:b2869acbcfad4d0daf73ff128999e172|@path:/ETF策略/大跌三成之後}
input:n(30,"下跌幅度");
input:period(60,"計算天數");

if close*(1+n/100) < close[period-1] then ret=1;

