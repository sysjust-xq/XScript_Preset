{@type:function_bool}
SetBarMode(1);

input:
	SeriesA(numericseries),
	SeriesB(numericseries);
 
variable:
	valA(0), valB(0), posA(0), posB(0), idx(0);

CrossUnder  = false;
posA = 0;
posB = 0;
valA = SeriesA[posA];
valB = SeriesB[posB];

if valA >= valB then 
	CrossUnder = false
else begin
	for idx = 1 to minlist(6, currentbar)
	begin
		posA = posA + 1;
		posB = posB + 1;
		valA = SeriesA[posA];
		valB = SeriesB[posB];
		if valA > valB then
		begin
			CrossUnder = true;
			break;
		end
		else
		begin
			if valA < valB then
			begin
				CrossUnder = false;
				break;
			end;
		end; 
	end;
end;
