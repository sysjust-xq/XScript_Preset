{@type:indicator}
{
指標說明
https://xstrader.net/趨勢檢定器/
}

input:Length(20,"計算期間");
 
LinearReg(close, Length, 0, value1, value2, value3, value4);
//做收盤價20天線性回歸
{value1:斜率,value4:預期值}
value5=rsquare(close,value4,Length);//算收盤價與線性回歸值的R平方 

plot1(value5,"R平方");
plot2(0.2,"趨勢成形線");