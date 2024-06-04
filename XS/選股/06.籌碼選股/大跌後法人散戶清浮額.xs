{@type:filter|@guid:9977ae93a9414cfb8e85b5cb659d737b|@path:/06.籌碼選股/大跌後法人散戶清浮額}
input:period(10);	setinputname(1,"計算跌幅區間");
input:percent1(10);	setinputname(2,"區間最小跌幅");

settotalbar(3);

value1=GetField("法人買賣超張數");
value2=GetField("融資增減張數");

if close[period-1] >= close*(1+percent1/100) and 
   value1 < 0 and 
   value2 < 0 and 
   close > close[1]
then ret=1;