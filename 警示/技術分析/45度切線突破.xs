{@type:sensor|@guid:6643e0e08e7a4b439b9d2002f60a7188|@path:/技術分析/45度切線突破}
input: period(20,"計算區間");
value1=rateofchange(close,period);
//計算區間漲跌幅
value2=arctangent(value1/period*100);
//計算上漲的角度
if value2 crosses over 45
then ret=1;