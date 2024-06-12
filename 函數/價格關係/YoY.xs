{@type:function}
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




