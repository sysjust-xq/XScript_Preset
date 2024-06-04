{@type:sensor|@guid:84f55c1a15ec4b76bc492fa4a803b2db|@path:/波段操作型/帶量突破糾結的均線|@hash:3ce778fc19b87cc8c35c2248592c3865}
input: shortlength(5); setinputname(1,"短期均線期數");
input: midlength(10); setinputname(2,"中期均線期數");
input: Longlength(20); setinputname(3,"長期均線期數");
input: Percent(2);  setinputname(4,"均線糾結區間%");
input: Volpercent(25);  setinputname(5,"放量幅度%");//帶量突破的量是超過最長期的均量多少%
variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);

settotalbar(8);
setbarback(maxlist(shortlength,midlength,Longlength));


if volume > average(volume,Longlength) * (1 + volpercent * 0.01) then
begin
	shortaverage = average(close,shortlength);
	midaverage = average(close,midlength);
	Longaverage = average(close,Longlength);
	if Close crosses over maxlist(shortaverage,midaverage,Longaverage) then
	begin
		value1= absvalue(shortaverage -midaverage);
		value2= absvalue(midaverage -Longaverage);
		value3= absvalue(Longaverage -shortaverage);
		if maxlist(value1,value2,value3)*100 < Percent*Close then  ret=1;
	end;
end;