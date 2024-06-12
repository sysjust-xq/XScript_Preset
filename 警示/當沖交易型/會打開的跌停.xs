{@type:sensor}
settotalbar(605);
if q_ask=GetField("跌停價", "D") and
   q_bestasksize1<1500 and
   (closeD(2)-close)>0.07*Close  
then ret=1;