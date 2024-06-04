{@type:function_bool|@guid:6850ead727a842bf883a1501d030ba98|@path:/邏輯判斷/CrossOver|@hash:718d4861266c2682cc607b41c1f65617}
SetBarMode(1);

input:
	SeriesA(numericseries),
	SeriesB(numericseries);
 
variable:
	valA(0), valB(0), posA(0), posB(0), idx(0);

CrossOver  = false;
posA = 0;
posB = 0;
valA = SeriesA[posA];
valB = SeriesB[posB];

if valA <= valB then 
	CrossOver = false
else begin
	for idx = 1 to minlist(6, currentbar)
	begin
		posA = posA + 1;
		posB = posB + 1;
		valA = SeriesA[posA];
		valB = SeriesB[posB];
		if valA < valB then
		begin
			CrossOver = true;
			break;
		end
		else
		begin
			if valA > valB then
			begin
				CrossOver = false;
				break;
			end;
		end; 
	end;
end;
