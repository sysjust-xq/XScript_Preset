{@type:function|@guid:52ede3e3fd6241998947a34920400c95|@path:/期權相關/HVolatility|@hash:18be7d1a7c4927c54c959a2f5865b3f4}
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
