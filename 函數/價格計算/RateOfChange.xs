{@type:function}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"


if thePrice[Length] <> 0 then RateOfChange = (thePrice / absvalue(thePrice[Length]) - sign(thePrice[Length])) * 100
else RateOfChange = 0;
        