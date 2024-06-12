{@type:filter}
input:Length(20,"期間");   //"計算期間"
settotalbar(20);

LinearReg(close, Length, 0, value1, value2, value3, value4);
//做收盤價20天線性回歸
{value1:斜率,value4:預期值}

value5=rsquare(close,value4,20);
//算收盤價與線性回歸值的R平方

if value1>0 and value5>0.2
then ret=1;