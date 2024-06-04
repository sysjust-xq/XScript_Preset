{@type:indicator|@guid:c53da56834064445ab0d5a26d3d8a704|@path:/技術指標/創新高天數減破底天數|@hash:cf128d85a27f59717e8a3ce6db151138}
input:period(12,"期數");

value1=countif(low<lowest(low[1],period),period);//近期創新低天數
value2=countif(high>highest(high[1],period),period);//近期創新高天數
value3=value2-value1;

plot1(value3,"天數差");
plot2(3);
plot3(-3);