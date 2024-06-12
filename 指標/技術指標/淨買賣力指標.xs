{@type:indicator}
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
