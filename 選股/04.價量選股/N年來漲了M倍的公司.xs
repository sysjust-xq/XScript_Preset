{@type:filter}
input:y1(10,"計算的年數");
input:ratio(800,"上漲的倍數%");

value1=rateofchange(GetField("收盤價","AM"),y1*12);

if value1>=ratio
then ret=1;