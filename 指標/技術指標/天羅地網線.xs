{@type:indicator}
input:period(60,"期數");

value5=average(close,period);
value6=standarddev(close,period,1);
value7=value5+value6;
value8=value5+2*value6;
value9=value5-value6;
value10=value5-2*value6;

plot1(value8,"+2SD");
plot2(value7,"+1SD");
plot3(value5,"MA");
plot4(value9,"-1SD");
plot5(value10,"-2SD");