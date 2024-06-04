{@type:indicator|@guid:80031d01d6fb434a97dc9b9c2ce7fd01|@path:/XQ量能指標/CV(積量指標)|@hash:a975bb3da3f198d29757f394b41c67be}
// XQ: CV指標
//
Variable: _cv(0);

If CurrentBar = 1 then
	_cv = Close * Volume
else	
	_cv = _cv[1] + (Close - Close[1]) * Volume;

Plot1(_cv, "CV");
		