{@type:indicator}
variable:vRatio(0);

if symboltype <> 5 then 
	raiseruntimeerror("僅支援選擇權");

vRatio = iff(leftstr(getsymbolinfo("買賣權"),1)="C",1,-1)*(100*getsymbolfield("Underlying","收盤價")/getsymbolinfo("履約價")-100);

plot1(vRatio,"價內外%");