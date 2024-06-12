{@type:indicator}
variable:coppock(0);
value1=rateofchange(close,14);
value2=rateofchange(close,11);
value3=value1+value2;
value4=xaverage(value3,10);
plot1(value4,"coppock indicator");
