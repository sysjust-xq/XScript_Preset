{@type:indicator|@guid:11da3ff5f71549bf86a84ca0a7bc1800|@path:/期權指標/價內外|@hash:233eb5a2e7eff1ec0a624751fe781a56}
variable:vRatio(0);

if symboltype <> 5 then 
	raiseruntimeerror("僅支援選擇權");

vRatio = iff(leftstr(getsymbolinfo("買賣權"),1)="C",1,-1)*(100*getsymbolfield("Underlying","收盤價")/getsymbolinfo("履約價")-100);

plot1(vRatio,"價內外%");