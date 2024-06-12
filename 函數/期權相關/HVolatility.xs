{@type:function}
SetBarMode(1);

input: 
	thePrice(numericseries),
	Length(numericsimple);

variable: 
	vTradingDays(SquareRoot(260));                                                  

vTradingDays = SquareRoot(260);
                                                                                
if thePrice[1] = 0 then 
	value1 = 0
else 
	value1 = Log(thePrice / thePrice[1]);

HVolatility = 100 * vTradingDays * StandardDev(value1, Length, 0) ;
