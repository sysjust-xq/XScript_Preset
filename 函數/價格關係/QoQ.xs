{@type:function|@guid:e15e5a9861d44a23bb77e9b4f08830b0|@path:/價格關係/QoQ}
SetBarMode(1);

input:QoQVal(numericseries);

if barfreq <> "Q" then
	raiseruntimeerror("僅支援季頻率")
else
	QoQ = 100*(QoQVal/QoQVal[1]-1);