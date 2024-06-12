{@type:function}
SetBarMode(1);

input:QoQVal(numericseries);

if barfreq <> "Q" then
	raiseruntimeerror("僅支援季頻率")
else
	QoQ = 100*(QoQVal/QoQVal[1]-1);