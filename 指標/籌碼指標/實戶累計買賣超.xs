{@type:indicator|@guid:1d8f7c722e8946cf8c3b0fde48c259ad|@path:/籌碼指標/實戶累計買賣超|@hash:789ca7d772b9d7af67c31efcd14e73bf}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("實戶買賣超張數"), Length);
volTotal = summation(Volume, Length);

Plot1(_buyTotal, "累計買賣超");
Plot2(_buyTotal * 100 / volTotal, "比例%");
