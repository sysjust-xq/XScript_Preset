{@type:indicator}
value1=average(close,5);
value2=average(volume,5);
value3=linearregslope(value1,5);
value4=linearregslope(value2,5);
value5=value4-value3;

plot1(value3,"價斜率");
plot2(value4,"量斜率");
plot3(value5,"斜率差");