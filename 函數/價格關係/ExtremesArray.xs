{@type:function}
SetBarMode(1);

input:
	SourceArray[MaxSize](numericarray), 	//來源陣列
	Size(numericsimple), 					//來源陣列大小
    DscAsc(numericsimple), 					//極大值(1)或極小值(-1)
	refExtremeValue(numericref), 			//輸出極值
	refExtremeIndex(numericref);			//輸出極值陣列索引值

variable:  	price(0),
			_bar(0),
			counter(0);

if  Size < 1 or Size > MaxSize then
begin
  refExtremeValue = 0 ;
  refExtremeIndex = -1 ;
  ExtremesArray = -1 ;
  return;
end;


price = SourceArray[1];
_bar = 1;

for counter = 2 to Size 
  begin
	if (DscAsc=1 and SourceArray[counter]>price) then
	  begin
		price = SourceArray[counter];
		_bar = counter;
	  end
	else if (DscAsc=-1 and SourceArray[counter]<price) then
	  begin	
		price = SourceArray[counter];
		_bar = counter;
	  end;
  end;

refExtremeValue = price;
refExtremeIndex = _bar;

ExtremesArray = 1;
        