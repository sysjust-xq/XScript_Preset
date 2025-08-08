{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

value1=getField("月營收年增率", "M", default := value1[1]);
plot1(value1,"月營收年增率");

value2 = getfield("月營收", "M", default:= value2[1]);
plot2(value2*100, "月營收(百萬)");
