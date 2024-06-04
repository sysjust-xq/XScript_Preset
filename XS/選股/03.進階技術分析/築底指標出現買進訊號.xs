{@type:filter|@guid:4c696cdf4497462da585408ba3777260|@path:/03.進階技術分析/築底指標出現買進訊號}
input: period(125);		setinputname(1, "計算區間長度");
input: length1(5);		setinputname(2, "短天期");
input: length2(20);		setinputname(3, "長天期");

variable:zd(0),zdma1(0),zdma2(0);

SetTotalBar(Period + 8);

zd = countif(close>=close[1],period) / countif(close<close[1],period);
zdma1 = average(zd,length1);
zdma2 = average(zd,length2);

if zdma1<1 and zdma2<1 and zdma1 crosses above zdma2
then ret=1;