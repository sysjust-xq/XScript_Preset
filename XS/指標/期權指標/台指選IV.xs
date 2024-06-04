{@type:indicator|@guid:68f71f14bb774362a0e6b3a320e4455c|@path:/期權指標/台指選IV|@hash:4acb7a0d0345ed3bfb34977f4310b7b7}
input: 
	iRate100(2,"無風險利率%");

variable:vStrikePrice(0);

if instr(symbol,".TF") = 0 or leftstr(symbol,1) = "F" or instr(symbol,"TX") = 0 then 
	raiseruntimeerror("僅支援台指選擇權");

vStrikePrice = getsymbolinfo("履約價");

value1 = ivolatility(leftstr(getsymbolinfo("買賣權"),1),getsymbolfield("FITX*1.TF","收盤價"),vStrikePrice,daystoexpirationtf,iRate100,0,c);

plot1(value1,"隱含波動率%");
