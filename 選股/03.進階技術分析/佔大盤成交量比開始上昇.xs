{@type:filter}
value1=GetField("佔全市場成交量比","D");

SetTotalBar(5);

if value1[4]=lowest(value1,5) and 
   value1=highest(value1,5) and 
   close crosses above average(close,5)
then ret=1;

SetOutputName1("佔全市場成交量比(%)");
OutputField1(value1);
