{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

value1=getField("應收帳款週轉率(次)", "Q", default:= value1[1]);
plot1(value1,"應收帳款週轉率(次)");
