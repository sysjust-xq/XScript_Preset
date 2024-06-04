{@type:function|@guid:3e627a6d22e74d239ac64246bf3787a0|@path:/技術指標/PercentB}
// %b from BollingerBand function
//

input: 
	Price(numericseries, "數列"),
	Length(numericsimple, "天數"), 
	UpperBand(numericsimple, "上"), 
	LowerBand(numericsimple, "下");

variable: up(0), down(0), mid(0);

up = bollingerband(Price, Length, UpperBand);
down = bollingerband(Price, Length, -1 * LowerBand);

if up - down <> 0 then 
	percentb = 100 * (Price - down) / (up - down) 
else 
	percentb = 0;
