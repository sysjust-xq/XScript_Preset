{@type:function|@guid:9ec26f1716414e6aad6802834a288bbe|@path:/價格關係/YoY}
SetBarMode(1);

input:YoYVal(numericseries);

switch(barfreq)
begin
	Case "M","AM":
		YoY = RateOfChange(YoYVal,12);
	Case "Q":
		YoY = RateOfChange(YoYVal,4);
	Case "Y":
		YoY = RateOfChange(YoYVal,1);
	default:
		raiseruntimeerror("僅支援月、季、年頻率");
end;




