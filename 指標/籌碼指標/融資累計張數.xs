{@type:indicator|@guid:fa99e55c9c144937bb3d112c2504c211|@path:/籌碼指標/融資累計張數|@hash:43ca54ca75bc48450562d9459c148128}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("融資增減張數"), Length);
volTotal = summation(Volume, Length);

Plot1(_buyTotal, "累計增減");
Plot2(_buyTotal * 100 / volTotal, "比例%");

