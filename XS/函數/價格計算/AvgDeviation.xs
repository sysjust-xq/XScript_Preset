{@type:function|@guid:c4e294ed436c4851ac42eb9fb79305f6|@path:/價格計算/AvgDeviation|@hash:76e697fea073b4d1d2ab7ab069a500ee}
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
        