{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

input:pe(10,"合理本益比");
var: _EPSSum1(0), _count1(0), _EPSSum2(0), _count2(0);

_EPSSum1 = 0;
_count1 = 0;
for value1 = 0 to 10 begin
    if CheckField("每股稅後淨利(元)", "Y")[value1] then begin
	    _EPSSum1 += getField("每股稅後淨利(元)", "Y")[value1];
		_count1 += 1;
		//print(currentBar, date, getFielddate("每股稅後淨利(元)", "Y")[value1], getField("每股稅後淨利(元)", "Y")[value1]);
		end;
	if _count1 = 10 then break;
	end;
	
_EPSSum2 = 0;
_count2 = 0;
for value1 = 0 to 5 begin
    if CheckField("每股稅後淨利(元)", "Q")[value1] then begin 
	    _EPSSum2 += getField("每股稅後淨利(元)", "Q")[value1];
		_count2 += 1;
		print(currentBar, date, getFielddate("每股稅後淨利(元)", "Q")[value1], getFielddate("每股稅後淨利(元)", "Q")[value1]);
		end;
	if _count2 = 4 then break;
	end;

if _count1 > 0 then value3=((_EPSSum1 / _count1)+_EPSSum2)/2;
value4=value3*pe;
plot1(value4,"10倍長期PE線");