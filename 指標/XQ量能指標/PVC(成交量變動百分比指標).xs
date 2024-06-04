{@type:indicator|@guid:f9bef2c70b524d02b289268268c08c61|@path:/XQ量能指標/PVC(成交量變動百分比指標)|@hash:1a3f1d74f9fc22b09bb7395c97f19acc}
// XQ: PVC指標
//
Input: Length(10);
Variable: _pvc(0);

SetInputName(1, "天數");

value1 = Average(Volume, Length);
if value1 <> 0 then
	_pvc = 100 * (Volume - value1) / value1
else
	_pvc = 0;

Plot1(_pvc, "PVC");
		