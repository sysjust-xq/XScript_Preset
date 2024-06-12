{@type:function_bool}
SetBarMode(1);

// 傳入一個序列(跟目前的頻率不同), 取得這個序列以此頻率的第幾筆
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// TFSeries是傳入的布林序列
// poi是要取得的位置
// 不支援XS選股、XS選股自訂排行與XS選股回測。
// 
input:
	FreqType(string), 
	TFSeries(truefalseseries),
	poi(numeric);
 
variable: _pos(0);

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

_pos = poi; 
if _pos <= 0 then
	xfMin_GetBoolean = TFSeries[0]
else
begin
	variable: idx(0), dt(0), dt2(0);
	idx = 0;
	while _pos > 0 and idx < currentbar-1
	begin
		switch (FreqType)
		begin
			case "1","5","10","15","30","60":
				dt = xfMin_getdtvalue(FreqType, datetime[idx]);
				dt2 = xfMin_getdtvalue(FreqType, datetime[idx+1]);
				if dt <> dt2 then _pos = _pos - 1; 
				idx = idx + 1;			  		 
			default:
				dt = xfMin_getdtvalue(FreqType, getfieldDate("Date")[idx]);
				dt2 = xfMin_getdtvalue(FreqType, getfieldDate("Date")[idx+1]);
				if dt <> dt2 then _pos = _pos - 1; 
				idx = idx + 1;
		end;
	end;
	xfMin_GetBoolean = TFSeries[idx];
end;