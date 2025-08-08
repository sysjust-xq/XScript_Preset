{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);

if CheckField("營業收入淨額", "Y") and CheckField("營業收入淨額", "Y")[1] and getField("營業收入淨額", "Y")[1] <> 0 then begin
    value1 = (getField("營業收入淨額", "Y") - getField("營業收入淨額", "Y")[1]) / getField("營業收入淨額", "Y")[1] * 100;
	end;

plot1(value1, "年營收年增率");

value2=getField("營業收入淨額", "Y", default := value2[1]);
plot2(value2,"年營收(百萬)");