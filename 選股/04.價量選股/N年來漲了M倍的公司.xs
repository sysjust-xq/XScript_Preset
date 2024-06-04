{@type:filter|@guid:52508f18dab84d33865c4ea6e581b712|@path:/04.價量選股/N年來漲了M倍的公司}
input:y1(10,"計算的年數");
input:ratio(800,"上漲的倍數%");

value1=rateofchange(GetField("收盤價","AM"),y1*12);

if value1>=ratio
then ret=1;