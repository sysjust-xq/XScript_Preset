{@type:indicator|@guid:59881eb02f224f6f85421c70d93f63eb|@path:/籌碼指標/外資換手比例|@hash:24ca0319e0045649834a72b046fe83c5}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("外資買張") + GetField("外資賣張"), Length);
volTotal = summation(Volume * 2, Length);

Plot1(_buyTotal, "換手張數");
Plot2(_buyTotal * 100 / volTotal, "比例%");
	


