{@type:sensor}
if GetSymbolField("tse.tw","收盤價") > average(GetSymbolField("tse.tw","收盤價"),10)
then begin
	if close<12
	and H = highest(H,20)
	and close<lowest(low,20)*1.07
	and highest(h,40)>close*1.1
	then ret=1;
end;
