{@type:indicator}
{
指標說明
Market Facilitation Index
}

if volume <> 0 then
	value1=(high-low)/volume;
if value1>value1[1] and volume>volume[1] then begin
	plot1(volume,"綠燈");
	noplot(2);
	noplot(3);
	noplot(4);
end;
if value1>value1[1] and volume<=volume[1] then begin
	plot2(volume,"偽裝");
	noplot(1);
	noplot(3);
	noplot(4);
end;
if value1<=value1[1] and volume>volume[1] then begin
	plot3(volume,"蟄伏");
	noplot(1);
	noplot(2);
	noplot(4);
end;
if value1<=value1[1] and volume<=volume[1] then begin
	plot4(volume,"衰退");
	noplot(1);
	noplot(2);
	noplot(3);
end;
