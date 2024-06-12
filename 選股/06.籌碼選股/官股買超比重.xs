{@type:filter}
input: lowlimit(30, "官股買超比重(%)");

value1 = getfield("官股券商買賣超張數", "D");
if value1 > 0 then begin
	value2 = value1 * 100 / volume;
	if value2 >= lowlimit then ret=1;
end;
	
	