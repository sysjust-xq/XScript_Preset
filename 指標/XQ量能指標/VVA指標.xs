{@type:indicator|@guid:9a7ff8e3e8b6400fb487805e2b9e9704|@path:/XQ量能指標/VVA指標|@hash:e77eaa6fcb3b9a4573c728c6a1f15e17}
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
		