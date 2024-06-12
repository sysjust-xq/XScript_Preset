{@type:function}
SetBarMode(1);

value1=average(rateofchange(close,12),10);
value2=average(rateofchange(close,20),10);
value3=average(rateofchange(close,30),8);
value4=average(rateofchange(close,40),15);

ret = value1+value2*2+value3*3+value4*4;
