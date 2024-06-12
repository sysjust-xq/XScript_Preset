{@type:function}
SetBarMode(2);

// XQ: VVA指標
//

if High <> Low then
	Value1 = (Close - Open)/(High - Low) * Volume
else
	Value1 = 0;

If CurrentBar = 1 then
	VVA = Value1
else	
	VVA = Value1 + VVA[1];
		