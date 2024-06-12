{@type:filter}
input: 
	Length(20, "天數"), 
	UpperBand(2, "上"), 
	LowerBand(2, "下"),
	BBW(80,"N");
	
variable: 
	bbandwidth(0);

bbandwidth = bollingerbandwidth(Close, Length, UpperBand, LowerBand);

if bbandwidth >= BBW then ret=1;

outputfield(1,bbandwidth,2,"布林帶寬");
