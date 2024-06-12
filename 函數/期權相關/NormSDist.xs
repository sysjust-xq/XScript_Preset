{@type:function}
SetBarMode(1);

//利用多項式計算近似值，精確度到小數點以下六位。

input: 
	zvalue(numericsimple);

variable: 
	a1(0.31938153),
    a2(-0.356563782),
    a3(1.781477937),
    a4(-1.821255978),
    a5(1.330274429),
	sqrtof2pi(2.506628275),
    gamma(0.2316419);
	
	
value1 = 1 / ( 1 + gamma * AbsValue( zvalue ) ) ;
value2 = ExpValue( -Square( zvalue ) * .5 ) / sqrtof2pi ;
value3 = 1 - value2 * ( ( ( ( ( a5 * value1 + a4 ) * value1 + a3 ) * value1 + a2 ) * value1 + a1 ) 
 * value1 ) ;

if zvalue < 0 then 
	NormSDist = 1 - value3
else
	NormSDist = value3;
