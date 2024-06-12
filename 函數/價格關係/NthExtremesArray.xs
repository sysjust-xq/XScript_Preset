{@type:function}
SetBarMode(1);

input:
	SourceArray[MaxSize](numericarray), 	//來源陣列
	Size(numericsimple), 					//來源陣列大小
	N(numericsimple),                       //極值順序
    DscAsc(numericsimple), 					//極大值(1)或極小值(-1)
	refExtremeValue(numericref), 			//輸出極值
	refExtremeIndex(numericref);			//輸出極值陣列索引值

array: ntharrayA[200](0),ntharrayB[200](0);
variable: x(0),y(0),temp(0);
variable: startIndex(0),endIndex(0),NIndex(0);

if N > Size or Size > MinList(MaxSize+1,200) then
begin 
	refExtremeValue = 0;
	refExtremeIndex = -1;
	NthExtremesarray = -1;
end
else 
begin
	if Size = MaxSize+1 then begin
		startIndex = 0;
		endIndex = MaxSize;
		NIndex = N - 1;
	end else begin
		startIndex = 1;
		endIndex = Size;
		NIndex = N;
	end;

	for x = startIndex to endIndex
	begin
		ntharrayA[x] = SourceArray[x];
		ntharrayB[x] = x;
	end;
	for x = startIndex to endIndex - 1
	begin
		for y = x + 1 to endIndex
		begin
			if((DscAsc = 1 and ntharrayA[x] < ntharrayA[y] )or
				(DscAsc = -1 and ntharrayA[x] > ntharrayA[y])) then
			begin
				temp = ntharrayA[x];
				ntharrayA[x] = ntharrayA[y];
				ntharrayA[y] = temp;
				
				temp = ntharrayB[x];
				ntharrayB[x] = ntharrayB[y];
				ntharrayB[y] = temp;
			end;
		end;
	end;
	refExtremeValue = ntharrayA[NIndex];
	refExtremeIndex = ntharrayB[NIndex];
	NthExtremesarray = 1;
end;