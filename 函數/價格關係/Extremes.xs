{@type:function}
SetBarMode(2);

input:  
	SourceSeries(numericseries), 	//來源數列
	Length(numericsimple), 			//計算期間
    DscAsc(numericsimple), 			//極大值(1)或極小值(-1)
	refExtremeValue(numericref), 	//輸出極值
	refExtremeBar(numericref);		//輸出極值K棒相對位置
	
var:
	exLength(0);

if 1 > Length then 
begin
  refExtremeValue = 0 ;
  refExtremeBar = -1 ;
  extremes = -1 ;
  return;
end;

if Length <> exLength or currentbar = 1 or value2 >= Length - 1 then
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
end
else begin
	if DscAsc * SourceSeries >= DscAsc * value1 then begin
		value1 = SourceSeries;
		value2 = 0;	
	end	else
		value2 = value2 + 1;
end;

exLength = Length;
refExtremeValue = value1;
refExtremeBar = value2;
Extremes = 1;