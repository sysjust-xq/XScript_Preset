{@type:indicator|@guid:4e5b3f6a39cf4eb1ab8ab2abfbe407ea|@path:/XQ量能指標/VRC(成交量變動指標)|@hash:36bccba464e93f2eb214a9eeb59620d5}
// XQ: VRC指標
//
Input: Length(12);
Variable: _vrc(0);

SetInputName(1, "天數");

if volume[Length] <> 0 then
	_vrc = 100 * (volume - volume[Length])/volume[Length]
else
	_vrc = 50;

Plot1(_vrc, "VRC");
		