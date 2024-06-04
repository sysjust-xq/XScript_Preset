{@type:function|@guid:5a24b5f217904930a81a074055f08762|@path:/價格關係/MoM}
SetBarMode(1);

input:MomVal(numericseries);

if barfreq <> "M" and barfreq <> "AM" then
	raiseruntimeerror("僅支援月頻率")
else
	MOM = (MomVal/MomVal[1]-1)*100;

