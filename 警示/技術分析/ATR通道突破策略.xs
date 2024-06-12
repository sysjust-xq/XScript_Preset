{@type:sensor}
input:period(20,"計算truerange的區間");

value1=average(truerange,period);
value2=average(close,period)+2*value1;

if close crosses over value2 then ret=1;
