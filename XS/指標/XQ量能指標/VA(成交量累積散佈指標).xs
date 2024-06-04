{@type:indicator|@guid:9487eadbc6fc4cbfb7ffb37a9a27e8f6|@path:/XQ量能指標/VA(成交量累積散佈指標)|@hash:51e8848f09df33c8f7259a9d0eef5c3b}
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
		