{@type:indicator|@guid:51c592abc12a4568a14d3a6402958d31|@path:/期權指標/溢價率|@hash:22393eaad2327afbd1732498357140bd}
variable:vRatio(0);

if symboltype <> 5 then 
	raiseruntimeerror("僅支援選擇權");

vRatio = 100 * (
iff(leftstr(getsymbolinfo("買賣權"),1)="C",1,-1) * (getsymbolinfo("履約價") - getsymbolfield("Underlying","收盤價")) + close)
/getsymbolfield("Underlying","收盤價");

plot1(vRatio,"溢價率%");