{@type:sensor}
input: period(20,"計算區間");
value1=rateofchange(close,period);
//計算區間漲跌幅
value2=arctangent(value1/period*100);
//計算上漲的角度
if value2 crosses over 45
then ret=1;