{@type:indicator|@guid:e6054b900bb94b948e9e849e825f693a|@path:/籌碼指標/投信累計買賣超|@hash:d12234f75497821d0e12e03a9785ddd0}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("投信買賣超"), Length);
volTotal = summation(Volume, Length);

Plot1(_buyTotal, "累計買賣超");
Plot2(_buyTotal * 100 / volTotal, "比例%");
