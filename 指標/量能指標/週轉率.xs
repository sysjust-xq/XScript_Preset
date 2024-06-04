{@type:indicator|@guid:4fcc4cdef06a46b3a978c636730fd03d|@path:/量能指標/週轉率|@hash:2dd5318a45db769d05c41021b0672144}
if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if GetField("發行張數(張)") <> 0 then begin
	value1 = volume / GetField("發行張數(張)") * 100;
	plot1(value1,"週轉率(%)");
end else 
	noplot(1);