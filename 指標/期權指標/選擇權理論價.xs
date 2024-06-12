{@type:indicator}
input: 
	iRate100(2,"無風險利率%"),
	iHV(20,"標的歷史波動率計算期間");

variable:vStrikePrice(0),vVolity100(0),vTTMdays(0);

if symboltype <> 5 then 
	raiseruntimeerror("僅支援選擇權");

if iHV > 0 then 
	vVolity100 = HVolatility(getsymbolfield("Underlying","收盤價","D"),iHV)
else 
	vVolity100 = 20;

vStrikePrice = getsymbolinfo("履約價");
vTTMdays = DateDiff(GetSymbolInfo("到期日"), Date) + 1;

value1 = bsprice(leftstr(getsymbolinfo("買賣權"),1),getsymbolfield("Underlying","收盤價"),vStrikePrice,vTTMdays,iRate100,0,vVolity100);

plot1(value1,"理論價");
