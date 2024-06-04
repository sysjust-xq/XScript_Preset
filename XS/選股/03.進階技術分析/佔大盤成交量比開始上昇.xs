{@type:filter|@guid:7217e31653a5440c827ccb7adb5fc22b|@path:/03.進階技術分析/佔大盤成交量比開始上昇}
value1=GetField("佔全市場成交量比","D");

SetTotalBar(5);

if value1[4]=lowest(value1,5) and 
   value1=highest(value1,5) and 
   close crosses above average(close,5)
then ret=1;

SetOutputName1("佔全市場成交量比(%)");
OutputField1(value1);
