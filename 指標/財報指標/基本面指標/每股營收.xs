{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

var: _sum(0), _count(0);

_sum = 0;
_count = 0;
for value1 = 0 to 17 begin
    if checkfield("月營收", "M")[value1] then begin
	    _sum += getField("月營收", "M")[value1];
		_count += 1;
		end;
	if _count = 12 then break;
	end;
	
value2 = getField("普通股股本", "Q", default:= 0);
if value2 <> 0 then value3 = _sum / value2 * 10;
plot1(value3, "每股營收(元)");