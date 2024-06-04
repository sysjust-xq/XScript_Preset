{@type:indicator|@guid:46b3ffb658594a8db360f331489188d5|@path:/籌碼指標/自營商累計買賣超|@hash:9009e626a64d151f93d77c271fc01146}
input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: _buyTotal(0), volTotal(0);

_buyTotal = summation(GetField("自營商買賣超"), Length);
volTotal = summation(Volume, Length);

Plot1(_buyTotal, "累計買賣超");
Plot2(_buyTotal * 100 / volTotal, "比例%");
