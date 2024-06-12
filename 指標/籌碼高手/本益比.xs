{@type:indicator}
//支援商品：台(股票)、美(股票)、美(特別股）
value1 = GetField("本益比");

if value1 > 0 then begin
	plot1(value1);
	setplotLabel(1,"PE");
end
else begin
	plot1(0);
	setplotLabel(1,"近4季EPS為負");
end;