{@type:filter|@guid:2703298e2aed4caeb70c9f6263634030|@path:/03.進階技術分析/布林帶寬小於N%}
input: 
	Length(20, "天數"), 
	UpperBand(2, "上"), 
	LowerBand(2, "下"),
	BBW(20,"N");
	
variable: 
	bbandwidth(0);

bbandwidth = bollingerbandwidth(Close, Length, UpperBand, LowerBand);

if bbandwidth <= BBW then ret=1;

outputfield(1,bbandwidth,2,"布林帶寬");
