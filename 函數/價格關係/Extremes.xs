{@type:function}
SetBarMode(2);

input:  
	SourceSeries(numericseries), 	//來源數列
	Length(numericsimple), 			//計算期間
    DscAsc(numericsimple), 			//極大值(1)或極小值(-1)
	refExtremeValue(numericref), 	//輸出極值
	refExtremeBar(numericref);		//輸出極值K棒相對位置
	
var:
	exLength(0),
	exCalcBar(0),
	calcInterval(0);

if 1 > Length then 
begin
  refExtremeValue = 0 ;
  refExtremeBar = -1 ;
  extremes = -1 ;
  return;
end;

if Length < exLength or currentbar = 1 or value2 >= Length - 1 then //強制進行重算的case
begin
	value1 = SourceSeries;
	value2 = 0;
	for value3 = 1 to Length - 1
	begin
		if DscAsc * SourceSeries[value3] > DscAsc * value1 then
		begin
			value1 = SourceSeries[value3];
			value2 = value3;	
		end;
	end;
end else if Length > exLength and Length - exLength = currentBar - exCalcBar then //判斷計算長度是否和K棒同步長大，若是，只需要計算差額。
begin
	calcInterval = Length - exLength;
	for value3 = calcInterval - 1 to 0
	begin
		if DscAsc * SourceSeries[value3] >= DscAsc * value1 then
		begin
			value1 = SourceSeries[value3];
			value2 = value3;	
		end	else
			value2 = value2 + 1;
	end;	
end else 
begin
	if DscAsc * SourceSeries >= DscAsc * value1 then begin
		value1 = SourceSeries;
		value2 = 0;	
	end	else
		value2 = value2 + 1;
end;

exLength = Length;
exCalcBar = currentBar;
refExtremeValue = value1;
refExtremeBar = value2;
extremes = 1;