{@type:sensor|@guid:7134ccb77b8b4153b24cbe772ad597c0|@path:/技術分析/ATR通道突破策略}
input:period(20,"計算truerange的區間");

value1=average(truerange,period);
value2=average(close,period)+2*value1;

if close crosses over value2 then ret=1;
