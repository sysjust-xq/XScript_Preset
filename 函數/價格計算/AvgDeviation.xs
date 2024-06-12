{@type:function}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable:	truesum(0),
			averageprice(0),
			counter(0);
truesum = 0;
averageprice = Average(thePrice,Length);

for counter = 0 to Length - 1  begin
	truesum = truesum + AbsValue(thePrice[counter] - averageprice);
end;

AvgDeviation = truesum / Length;
        