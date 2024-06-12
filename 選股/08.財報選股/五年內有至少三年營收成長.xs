{@type:filter}
value1=GetField("營業收入淨額","Y");
value2=value1-value1[1];
if countif(value2>0,5)>=3
then ret=1;
