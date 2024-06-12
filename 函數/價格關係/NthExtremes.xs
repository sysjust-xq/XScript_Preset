{@type:function}
SetBarMode(1);

input:  
	SourceSeries(numericseries), 	//來源數列
	Length(numericsimple), 			//計算期間
    N(numericsimple),               //極值順序
    DscAsc(numericsimple), 			//極大值(1)或極小值(-1)
	refExtremeValue(numericref), 	//輸出極值
	refExtremeBar(numericref);		//輸出極值K棒相對位置
	

array: nthA[500](0),nthB[500](0);
variable:x(0),y(0),temp(0);


if N>Length or Length>500 then
begin
    refExtremeValue = 0;
    refExtremeBar = -1;
    NthExtremes = -1;
end
else
begin
    for x = 0 to Length -1
    begin
        nthA[x] = SourceSeries[x];
        nthB[x] = x ;
    end;
	
    for x = 0 to Length -2
	begin
		for y = x + 1 to Length -1
		begin
			if ((DscAsc=1 and nthA[x] < nthA[y])or
				(DscAsc=-1 and nthA[x] > nthA[y])) then
			begin	
				temp = nthA[ y ];
                nthA[ y ] = nthA[ x ];
                nthA[ x ] = temp;
				temp = nthB[ y ];
                nthB[ y ] = nthB[ x ];
                nthB[ x ] = temp;
			end;
		end;
	end;
    refExtremeValue = 	nthA[ N-1 ];
    refExtremeBar	= 	nthB[ N-1 ] + ExecOffset;
    NthExtremes = 1;

end;
