{@type:sensor|@guid:b0141dad3e1a4ee69bc0dca2b8886fd1|@path:/當沖交易型/會打開的跌停}
settotalbar(605);
if q_ask=GetField("跌停價", "D") and
   q_bestasksize1<1500 and
   (closeD(2)-close)>0.07*Close  
then ret=1;