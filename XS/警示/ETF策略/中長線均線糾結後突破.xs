{@type:sensor|@guid:fa24e5fc27d54f49b5907519a8c9d07d|@path:/ETF策略/中長線均線糾結後突破}
input: Shortlength(10,"短期均線期數");
input: Midlength(20,"中期均線期數");
input: Longlength(40,"長期均線期數");
input: Percent(2,"均線糾結區間%");
input: Volpercent(20,"放量幅度%");//帶量突破的量是超過最長期的均量多少%

variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);

if volume > average(volume,Longlength) * (1 + volpercent * 0.01) and volume > 1000 then
begin
	shortaverage = average(close,Shortlength);
	midaverage = average(close,Midlength);
	Longaverage = average(close,Longlength);
	
	value2=  maxlist(shortaverage,midaverage,Longaverage );
	value3=  minlist(shortaverage,midaverage,Longaverage );
	
	if close crosses over value2
	and (value2-value3)*100 < Percent*close 
	then ret=1;
end;

 

