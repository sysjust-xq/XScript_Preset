{@type:function}
SetBarMode(1);

variable:string1(""),string2(""),string3("");
variable:strike(0),cpflag(""),ww(0),mm(0),yy(0);

if instr(symbol,".TF") = 0 or instr(symbolname, "現貨") <> 0 then 
	raiseruntimeerror("僅支援台股指數類期貨及選擇權")
else
	string1 = leftstr(symbol,strlen(symbol) - 3);

if instr(symbol, "*") = 0 then 
begin
    if DateDiff(GetSymbolInfo("到期日"), date) + 1 <= 0 then DaysToExpirationTF = 0 else DaysToExpirationTF = DateDiff(GetSymbolInfo("到期日"), date) + 1;
	return;
	end
else if leftstr(string1,1) = "F" or midstr(string1,3,1) = "O" then
begin
	yy = year(date);
	if leftstr(string1,1) = "F" then
		mm = strtonum(midstr(string1,5,2))
	else
		mm = strtonum(midstr(string1,4,2));
	if mm = 0 then begin
		mm = month(date);
		value1 = 0;
		while (value1 < strtonum(rightstr(string1,1)))
		begin
			DaysToExpirationTF = daystoexpiration(mm,yy);
			if (DaysToExpirationTF > 0) then value1 = value1 + 1;
			value99 = DateAdd(encodedate(yy,mm,1),"M",1);
			mm = month(value99);
			yy = year(value99);
		end;
		return;
	end;
	DaysToExpirationTF = daystoexpiration(mm,yy);
	return;
end else if leftstr(string1,2) = "TX" then
begin 
	value99 = NthDayofMonth(date,1,3);
	DaysToExpirationTF = DateDiff(value99, Date) + 1;
	return;
end;

DaysToExpirationTF = -1;