{@type:filter}
setbarfreq("M");
settotalbar(12);

if close>close[1]*1.2 then 
begin
	ret=1;
	outputfield(1,intportion(date*0.01),0,"上漲的月份");
end;

