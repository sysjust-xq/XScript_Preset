{@type:indicator|@guid:d815bebf4fe94e259274a60214fe350a|@path:/籌碼高手/殖利率|@hash:a9cbbc0ff8f49a51ce77004b3668e31e}
//支援商品：台(股票)、台(ETF)、美(股票)、美(ETF)、美(特別股)。
value1 = GetField("殖利率");

if value1 > 0 then begin
	plot1(value1/100);
	setplotLabel(1,"殖利率");
end	
else begin
	plot1(0);
	setplotLabel(1,"無配息紀錄");
end;