{@type:indicator}
if BarFreq <> "d" and BarFreq <> "ad" then raiseruntimeerror("僅支援日與還原日頻率");

value1 = GetField("處置開始日期");
value2 = GetField("處置結束日期");
value3 = getField("Date");
if value1 = 0 then raiseruntimeerror("無處置的歷史紀錄");

//用點顯示處置區間
if value3 >= value1 and value3 <= value2 then plot1(value1,"處置中") //尚在處置中
else noplot(1);

//用來顯示處置相關的日期數值
if value1 <> value1[1] or (value3 >= value1 and value3 <= value2) then begin
	plot3(value1,"開始日期");
	plot4(value2,"結束日期");
end else begin
	noplot(3);
	noplot(4);
end;