{@type:indicator}
input: 
	iRate100(2,"無風險利率%");

variable:vStrikePrice(0),vTTMdays(0);

if symboltype <> 5 then 
	raiseruntimeerror("僅支援選擇權");

vStrikePrice = getsymbolinfo("履約價");
vTTMdays = DateDiff(GetSymbolInfo("到期日"), Date) + 1;

value1 = ivolatility(leftstr(getsymbolinfo("買賣權"),1),getsymbolfield("Underlying","收盤價"),vStrikePrice,vTTMdays,iRate100,0,c);

plot1(value1,"隱含波動率%");
