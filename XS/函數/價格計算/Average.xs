{@type:function|@guid:3a62e42e463c46b58e5dee79ae1e581c|@path:/價格計算/Average|@hash:b6e5444e030014d481ae7a951f0095d5}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"
 
if  Length > 0 then
	Average = Summation(thePrice, Length) / Length
else  
	Average =0;
	
        