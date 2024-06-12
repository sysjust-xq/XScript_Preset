{@type:function_bool}
SetBarMode(1);

// 傳入兩個序列(跟目前的頻率不同), 判斷是否crossunder
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// SeriesA, SeriesB是傳入的序列
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string), 
	SeriesA(numericseries),
	SeriesB(numericseries);

variable:
	valA(0), valB(0), posA(0), posB(0);

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");
 
posA = 0;
posB = 0;
valA = xfMin_getvalue(FreqType, SeriesA, posA);
valB = xfMin_getvalue(FreqType, SeriesB, posB);

if valA >= valB then
begin
	xfMin_CrossUnder = false;
	return;
end; 

variable: idx(0);
for idx = 1 to 6
begin
	posA = posA + 1;
	posB = posB + 1;
	valA = xfMin_getvalue(FreqType, SeriesA, posA);
	valB = xfMin_getvalue(FreqType, SeriesB, posB);
	if valA > valB then
	begin
		xfMin_CrossUnder = true;
		return;
	end
	else
	begin
		if valA < valB then
		begin
			xfMin_CrossUnder = false;
			return;
		end;
	end; 
end;
xfMin_CrossUnder = false;