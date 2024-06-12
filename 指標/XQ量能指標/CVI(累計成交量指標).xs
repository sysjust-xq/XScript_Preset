{@type:indicator}
// XQ: CVI指標
//
variable: _cvi(0);

If CurrentBar > 1 then
	_cvi = _cvi[1] + GetField("UpVolume") - GetField("DownVolume");

Plot1(_cvi, "CVI");
