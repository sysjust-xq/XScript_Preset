{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

if checkfield("營業收入淨額", "Q")[4] and checkField("營業收入淨額", "Q") and getField("營業收入淨額", "Q")[4] <> 0 then 
    value1 = 100 * (getField("營業收入淨額", "Q") - getField("營業收入淨額", "Q")[4]) / getField("營業收入淨額", "Q")[4];
	
plot1(value1, "季營收年增率");

value2 = getField("營業收入淨額", "Q", default := value2[1]);
plot2(value2, "季營收(百萬)");