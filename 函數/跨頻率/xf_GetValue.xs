{@type:function|@guid:ae592f43d76b43c589aaa0eb0e6ecb27|@path:/跨頻率/xf_GetValue|@hash:e884314ac6dc0eea0e139763e449c558}
SetBarMode(1);

// 傳入一個序列(跟目前的頻率不同), 取得這個序列以此頻率的第幾筆
//
// FreqType是傳入序列的資料期別, 支援"D", "W", "M"
// PriceSeries是傳入的序列
// poi是要取得的位置
// 
input:
	FreqType(string), 
	PriceSeries(numericseries),
	poi(numeric);
 
variable: _pos(0);
  
_pos = poi; 
if _pos <= 0 then
	xf_GetValue = PriceSeries[0]
else
begin
	variable: idx(0), dt(0), dt2(0);
	idx = 0;
	while _pos > 0 and idx < currentbar-1
	begin
		dt = xf_getdtvalue(FreqType, getfieldDate("Date")[idx]);
		dt2 = xf_getdtvalue(FreqType, getfieldDate("Date")[idx+1]);
		if dt <> dt2 then _pos = _pos - 1; 
		idx = idx + 1;
	end;
	xf_GetValue = PriceSeries[idx];
end;