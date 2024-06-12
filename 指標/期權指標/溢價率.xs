{@type:indicator}
variable:vRatio(0);

if symboltype <> 5 then 
	raiseruntimeerror("僅支援選擇權");

vRatio = 100 * (
iff(leftstr(getsymbolinfo("買賣權"),1)="C",1,-1) * (getsymbolinfo("履約價") - getsymbolfield("Underlying","收盤價")) + close)
/getsymbolfield("Underlying","收盤價");

plot1(vRatio,"溢價率%");