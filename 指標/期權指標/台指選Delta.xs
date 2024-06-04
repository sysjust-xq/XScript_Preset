{@type:indicator|@guid:bf35976c6da24e538da62305c2a720bf|@path:/期權指標/台指選Delta|@hash:64fc4de0eafc56974494d6e3294d39b5}
input: 
	iRate100(2,"無風險利率%"),
	iVolity100(20,"波動率%"),
	iHV(false, "波動率", inputkind:=dict(["標的20日歷史波動率",true],["固定波動率",false]));

variable:vStrikePrice(0),vVolity100(0);

if instr(symbol,".TF") = 0 or leftstr(symbol,1) = "F" or instr(symbol,"TX") = 0 then 
	raiseruntimeerror("僅支援台指選擇權");



if iHV then 
	vVolity100 = HVolatility(getsymbolfield("FITX*1.TF","收盤價","D"),20)
else 
	vVolity100 = iVolity100;

vStrikePrice = getsymbolinfo("履約價");

value1 = bsdelta(leftstr(getsymbolinfo("買賣權"),1),getsymbolfield("FITX*1.TF","收盤價"),vStrikePrice,daystoexpirationtf,iRate100,0,vVolity100);

plot1(value1,"Delta");
