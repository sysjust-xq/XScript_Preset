{@type:function}
SetBarMode(2);

variable: tp(0), tv(0), utv(0), dtv(0), pmf(0), nmf(0), mfivalue(0);

tp = (getsymbolfield("TSE.TW","最高價")+getsymbolfield("TSE.TW","最低價")+getsymbolfield("TSE.TW","收盤價")) /3;
tv = tp * getsymbolfield("TSE.TW","成交量");

if tp > tp[1] then begin
	utv = tv;
	dtv = 0;
end else begin
	utv = 0;
	dtv = tv;
end;

pmf = Average(utv, MinList(CurrentBar, 6));
nmf = Average(dtv, MinList(CurrentBar, 6));

if CurrentBar < 6 or (pmf + nmf) = 0 then
	mfivalue = 50
else 
	mfivalue = 100 * pmf /(pmf + nmf);

if mfivalue > 50 then
	tsemfi = 1
else
	tsemfi = 0;

		