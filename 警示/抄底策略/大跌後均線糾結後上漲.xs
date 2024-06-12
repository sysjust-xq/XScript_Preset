{@type:sensor}
input: s1(5,"短期均線期數");
input: s2(10,"中期均線期數");
input: s3(20,"長期均線期數");
input: Percent(2,"均線糾結區間%");
input: Volpercent(25,"放量幅度%");//帶量突破的量是超過最長期的均量多少%

variable: Shortaverage(0);
variable: Midaverage(0);
variable: Longaverage(0);

if volume > average(volume,s3) * (1 + volpercent * 0.01)
//放量25%
and lowest(volume,s3)<1000
//區間最低量小於一千張
and volume>2000
//今日成交量突破2000張
then begin
	Shortaverage = average(close,s1);
	Midaverage = average(close,s2);
	Longaverage = average(close,s3);
	value1= maxlist(Shortaverage,Midaverage,Longaverage) - minlist(Shortaverage,Midaverage,Longaverage);
	
	if  value1*100 < Percent*Close
	and linearregangle(value1,5)<10
	//均線糾結在一起
	and close*1.3<close[40]
	//最近四十個交易日跌了超過三成
	then ret=1; 
end;