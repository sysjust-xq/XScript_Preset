{@type:function}
SetBarMode(2);

If CurrentBar = 1 then
	CV = Close * Volume
else	
	CV = CV[1] + (Close - Close[1]) * Volume;
		