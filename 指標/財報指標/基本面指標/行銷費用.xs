{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

value1=getField("推銷費用", "Q", default := value1[1]);
value2=getField("銷售費用比", "Q", default := value2[1]);
plot1(value1,"推銷費用(百萬)");
plot2(value2,"銷售費用比");