{@type:function}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"
 
if  Length > 0 then
	Average = Summation(thePrice, Length) / Length
else  
	Average =0;
	
        