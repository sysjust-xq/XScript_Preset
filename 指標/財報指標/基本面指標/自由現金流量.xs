{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

var: _sum1(0), _count1(0), _sum2(0), _count2(0);

_sum1 = 0;
_count1 = 0;
_sum2 = 0;
_count2 = 0;
for value1 = 0 to 5 begin
    if checkField("自由現金流量", "Q")[value1] then begin
	    _sum1 += getField("自由現金流量", "Q")[value1];
		_count1 += 1;
		end;
	if _count1 = 4 then break;
	end;

for value1 = 0 to 5 begin
	if checkField("自由現金流量營收比", "Q")[value1] then begin
	    _sum2 += getField("自由現金流量營收比", "Q")[value1];
		_count2 += 1;
		end;
	if _count2 = 4 then break;
	end;
	
if _count1 <> 0 then value2 = _sum1 / _count1;
if _count2 <> 0 then value3 = _sum2 / _count2;

plot1(value2,"自由現金流量(百萬)");
plot2(value3,"自由現金流量營收比");