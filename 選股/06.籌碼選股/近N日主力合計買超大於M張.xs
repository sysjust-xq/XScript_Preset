{@type:filter}
value1=GetField("主力買賣超張數","D");
input:days(5,"計算天期");
input:lowmit(200,"買超最低張數");
if summation(value1,days)>=lowmit
then ret=1;