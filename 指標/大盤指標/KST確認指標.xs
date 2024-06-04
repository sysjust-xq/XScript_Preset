{@type:indicator|@guid:eb1cbea2a6ff4abe99bb0bf58575882c|@path:/大盤指標/KST確認指標|@hash:bf92ecb1cd273ffbb7935b5045d49beb}
variable:kst(0);

value1=average(rateofchange(close,12),10);
value2=average(rateofchange(close,20),10);
value3=average(rateofchange(close,30),8);
value4=average(rateofchange(close,40),15);

kst=value1+value2*2+value3*3+value4*4;

plot1(kst,"KST確認指標");