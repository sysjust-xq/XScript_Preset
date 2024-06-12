{@type:sensor}
settotalbar(700);

if getsymbolfield("tse.tw","收盤價") > average(getsymbolfield("tse.tw","收盤價"),10) then begin
	value4=GetField("總市值");
	value5=average(value4,600);
	if value4[1]<value5[1]*0.7
	and close=highest(close,10)
	then ret=1;
end;