{@type:indicator}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("融資增減張數"), Length);
volTotal = summation(Volume, Length);

Plot1(_buyTotal, "累計增減");
Plot2(_buyTotal * 100 / volTotal, "比例%");

