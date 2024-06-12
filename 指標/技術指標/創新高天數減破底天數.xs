{@type:indicator}
input:period(12,"期數");

value1=countif(low<lowest(low[1],period),period);//近期創新低天數
value2=countif(high>highest(high[1],period),period);//近期創新高天數
value3=value2-value1;

plot1(value3,"天數差");
plot2(3);
plot3(-3);