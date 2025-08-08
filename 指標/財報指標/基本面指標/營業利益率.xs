{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

value1=getField("營業利益率", "Q", default := value1[1]);
plot1(value1,"營業利益率");

if checkfield("營業利益率", "Q")[4] and checkField("營業利益率", "Q") and getField("營業利益率", "Q")[4] <> 0 then 
    value2 = 100 * (getField("營業利益率", "Q") - getField("營業利益率", "Q")[4]) / getField("營業利益率", "Q")[4];
	
plot2(value2, "營業利益率年增率");
