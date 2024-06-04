{@type:indicator|@guid:6f219bedb9304cfa8ef4525123a7c368|@path:/技術指標/R平方|@hash:315dc86160b5849d6c00a48905449b0b}
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