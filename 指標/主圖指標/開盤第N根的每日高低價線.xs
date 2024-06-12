{@type:indicator}
Input:Length(1,"第N根K棒");

Var:_MH(0), _ML(0), _HHMMSS(0), _ChageDNum(0), _MaxCDN(0);

if barfreq <> "Min" then raiseRunTimeError("僅支援分鐘頻率");
if Length = 0 then raiseRunTimeError("參數請設定大於0的合理數值");
if gettotalBar = currentBar and Length - 1 > _MaxCDN then raiseRunTimeError("參數設定超過每日分鐘K棒數");

if getfieldDate("date") <> getfieldDate("date")[1] then 
	_ChageDNum = 0
else begin
	_ChageDNum += 1;
end;

if _ChageDNum > _MaxCDN then _MaxCDN = _ChageDNum;

if _ChageDNum < Length - 1  then begin
	NoPlot(1);
	NoPlot(2);
	NoPlot(3);
end else if _ChageDNum = Length - 1  then begin
	_MH = GetField("最高價", "D");
	_ML = GetField("最低價", "D");
	_HHMMSS = time;
	plot1(_HHMMSS,"時間");
	plot2(_MH,"最高價");
	plot3(_ML,"最低價");
end else begin
	plot1(_HHMMSS,"時間");
	plot2(_MH,"最高價");
	plot3(_ML,"最低價");
end;

setplotLabel(1,Text("第",NumToStr(Length, 0),"根時間"));
