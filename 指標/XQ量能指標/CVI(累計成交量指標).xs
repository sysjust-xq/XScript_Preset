{@type:indicator|@guid:24178337e08b448bb53177c3154e5e20|@path:/XQ量能指標/CVI(累計成交量指標)|@hash:5c0cc57072c2df971da4977adffe87cb}
// XQ: CVI指標
//
variable: _cvi(0);

If CurrentBar > 1 then
	_cvi = _cvi[1] + GetField("UpVolume") - GetField("DownVolume");

Plot1(_cvi, "CVI");
