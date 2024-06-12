{@type:sensor}
//函數是用來協助語法快速運算的功能

//===========範例：均線糾結======================

//1.宣告參數：利用input宣告輸入的參數。
input:shortLen(5),midLen(10),longLen(20),percent(0.02);

//4.運用函數
//透過average這個函數計算數列的平均值
value1=average(close,shortLen);//短期移動平均
value2=average(close,midLen);//中期移動平均
value3=average(close,longLen);//長期移動平均
value4=value1-value2;
value5=value2-value3;
value6=value1-value3;

//6.設定警示條件：if.. then ret=1;
if absvalue(value4)/close<percent 
and absvalue(value5)/close<percent 
and absvalue(value6)/close<percent
and close crosses above maxlist(value1,value2,value3)
then ret=1;