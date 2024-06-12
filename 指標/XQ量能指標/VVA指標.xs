{@type:indicator}
// XQ: VVA指標
//
variable: _vva(0);

if High <> Low then
	Value1 = (Close - Open)/(High - Low) * Volume
else
	Value1 = 0;

If CurrentBar = 1 then
	_vva = Value1
else	
	_vva = Value1 + _vva[1];

Plot1(_vva, "VVA");
		