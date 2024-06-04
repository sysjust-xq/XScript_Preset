{@type:filter|@guid:032d9e7d87ca445ca4336eeff409ab6d|@path:/04.價量選股/曾經一個月漲超過兩成的股票}
setbarfreq("M");
settotalbar(12);

if close>close[1]*1.2 then 
begin
	ret=1;
	outputfield(1,intportion(date*0.01),0,"上漲的月份");
end;

