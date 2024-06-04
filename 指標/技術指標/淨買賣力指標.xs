{@type:indicator|@guid:c1aaf4948dd947248a8a6d200795284b|@path:/技術指標/淨買賣力指標|@hash:02714bfa288ce43400ddf0cb235d78cb}
input: Period(20,"期數");

if high<>low and truerange <> 0 then begin 
	value1=((high-open)+(close-low))/truerange;
	value2=((open-low)+(high-close))/truerange;
end else begin
	value1=value1[1];
	value2=value2[1];
end;
value3=value1-value2;
value4=average(value3,Period);
 
plot1(value4,"平均淨買賣力");
