{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

input:period(4,"移動平均月份數");
var: _sum(0), _count(0);

_sum = 0;
_count = 0;
for value1 = 0 to (period + 5) begin
    if CheckField("月營收年增率", "M")[value1] then begin
	    _sum += getField("月營收年增率", "M")[value1];
		_count += 1;
		end;
	if _count = period then break;
	end;

if _count > 0 then value1 = _sum / _count;
plot1(value1, "月營收年增率移動平均");
    