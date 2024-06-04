{@type:function|@guid:a8153950ff2d4a82911189a9df156b3d|@path:/技術指標/CV|@hash:8c9b3f2888fa0ff23834d2b28471f95b}
SetBarMode(2);

If CurrentBar = 1 then
	CV = Close * Volume
else	
	CV = CV[1] + (Close - Close[1]) * Volume;
		