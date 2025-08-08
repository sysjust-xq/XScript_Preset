{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

input: _index("I026010.TW", "指標代碼");
group: _symbolGroup();
var: _sum(0), _num(0);

_symbolGroup = GetSymbolGroup(_index, "成分股");
value1 = GroupSize(_symbolGroup);

_sum = 0;
_num = 0;
for value2 = 1 to value1 begin
    if CheckSymbolField(_symbolGroup[value2], "月營收", "M") then begin
        _sum += GetSymbolField(_symbolGroup[value2], "月營收", "M");
		_num += 1;
        end;
	end;
	
plot1(_sum);
SetPlotLabel(1, text(_index, "成分股月營收"));
plot2(_num);
SetPlotLabel(2, text(_index, "有月營收家數"));
plot3(value1);
SetPlotLabel(3, text(_index, "成分股家數"));