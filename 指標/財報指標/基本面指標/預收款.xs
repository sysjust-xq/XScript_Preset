{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

value1 = GetField("預收款項", "Q", default:= value1[1]);
if checkfield("預收款項", "Q") and checkfield("預收款項", "Q")[4] and GetField("預收款項", "Q")[4] <> 0 then 
    value2 = (GetField("預收款項", "Q") - GetField("預收款項", "Q")[4]) / GetField("預收款項", "Q")[4];
	
plot1(value1,"預收款(百萬)");
plot2(value2,"預收款年增率");