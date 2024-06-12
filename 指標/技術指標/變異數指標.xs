{@type:indicator}
input:length1(10,"短天期期別");
input:length2(20,"長天期期別");

value1=varianceps(close,length1,1);
value2=varianceps(close,length2,1);

plot1(value1,"短天期變異數");
plot2(value2,"長天期變異數");
