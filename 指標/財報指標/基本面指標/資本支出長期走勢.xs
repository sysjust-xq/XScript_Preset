{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

var: _sum(0), _count(0);

_sum = 0;
_count = 0;
for value1 = 0 to 5 begin
    if checkField("資本支出金額", "Q")[value1] then begin
	    _sum += getField("資本支出金額", "Q")[value1];
		_count += 1;
		end;
	if _count = 4 then break;
	end;

plot1(_sum, "資本支出(百萬)");