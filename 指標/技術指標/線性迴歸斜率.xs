{@type:indicator}
{
指標說明
https://xstrader.net/尋找目前趨勢還向上的股票/
}

input:Length(20,"計算期間");

variable: _Output(0);

LinearReg(close, Length, 0, value1, value2, value3, value4);
{value1:斜率,value4:預期值}

plot1(value1,"線性迴歸斜率");
        