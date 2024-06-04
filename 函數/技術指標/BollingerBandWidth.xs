{@type:function|@guid:1993dfb6119f4830adab63f5ce6ee2b6|@path:/技術指標/BollingerBandWidth}
// BollingerBand Width function
//

input: 
	Price(numericseries, "數列"),
	Length(numericsimple, "天數"), 
	UpperBand(numericsimple, "上"), 
	LowerBand(numericsimple, "下");
	
variable: 
	up(0), down(0), mid(0), bbandwidth(0);

up = bollingerband(Price, Length, UpperBand);
down = bollingerband(Price, Length, -1 * LowerBand);
mid = (up + down) / 2;

if mid <> 0 then 
	bollingerbandwidth = 100 * (up - down) / mid
else
	bollingerbandwidth = 0;
