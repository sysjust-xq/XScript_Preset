{@type:indicator|@guid:41fa630c7b2b4ea3bc20212bb6bea3be|@path:/籌碼指標/法人累計買賣超|@hash:d9cf5ea868c12ba9ed76c58078d56fac}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("法人買賣超張數"), Length);
volTotal = summation(Volume, Length);

Plot1(_buyTotal, "累計買賣超");
Plot2(_buyTotal * 100 / volTotal, "比例%");
