{@type:indicator|@guid:7571a7438dba4175910b5c1037ab6e33|@path:/技術指標/coppock indicator|@hash:811d96db98fea169121f9300de7ecb99}
variable:coppock(0);
value1=rateofchange(close,14);
value2=rateofchange(close,11);
value3=value1+value2;
value4=xaverage(value3,10);
plot1(value4,"coppock indicator");
