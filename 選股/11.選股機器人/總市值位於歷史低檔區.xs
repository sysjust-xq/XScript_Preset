{@type:filter}
setbarfreq("AD");

input:period(1250,"計算天數");
input:ratio(10,"距離低點幅度");

value1=GetField("總市值");
value2=lowest(GetField("總市值"),period);

if value1<value2*(1+ratio/100)
//總市值距離過去一段時間最低點沒有差多遠
then begin

	if close=highest(close,20)
	and close<close[19]*1.07
	and close crosses over average(close,20)
	and close<=15

	then ret=1;

end;

outputfield(1, value1, 2, "總市值(億)", order := -1);
