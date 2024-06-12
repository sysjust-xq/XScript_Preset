{@type:indicator}
// XQ: VA指標
//
Variable: _va(0);

if High <> Low then
	Value1 = ((Close - Low) - (High - Close))/(High - Low) * Volume
else
	Value1 = 0;

If CurrentBar = 1 then
	_va = Value1
else	
	_va = Value1 + _va[1];

Plot1(_va, "VA");
		