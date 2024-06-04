{@type:sensor|@guid:6d7c71dd525d4cf08880d77f3ec2c336|@path:/當沖交易型/開低不反彈再創新低}
if barfreq <>"Min" or barinterval<> 1 then raiseruntimeerror("本腳本只適用於1分鐘線");

variable:count(0);

if date<>date[1] then count=0;
count=count+1;
  
if GetField("開盤價","D")*1.025< GetField("收盤價","D")[1] 
and count>10
and lowest(low[1],count-1)*1.015>highest(high[1],count-1)
and close =lowest(low,count)
then ret=1;