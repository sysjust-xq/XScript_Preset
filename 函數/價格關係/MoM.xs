{@type:function}
SetBarMode(1);

input:MomVal(numericseries);

if barfreq <> "M" and barfreq <> "AM" then
	raiseruntimeerror("僅支援月頻率")
else
	MOM = (MomVal/MomVal[1]-1)*100;

