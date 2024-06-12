{@type:indicator}
// XQ: CV指標
//
Variable: _cv(0);

If CurrentBar = 1 then
	_cv = Close * Volume
else	
	_cv = _cv[1] + (Close - Close[1]) * Volume;

Plot1(_cv, "CV");
		