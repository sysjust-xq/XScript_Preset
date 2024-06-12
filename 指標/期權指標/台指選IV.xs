{@type:indicator}
input: 
	iRate100(2,"無風險利率%");

variable:vStrikePrice(0);

if instr(symbol,".TF") = 0 or leftstr(symbol,1) = "F" or instr(symbol,"TX") = 0 then 
	raiseruntimeerror("僅支援台指選擇權");

vStrikePrice = getsymbolinfo("履約價");

value1 = ivolatility(leftstr(getsymbolinfo("買賣權"),1),getsymbolfield("FITX*1.TF","收盤價"),vStrikePrice,daystoexpirationtf,iRate100,0,c);

plot1(value1,"隱含波動率%");
