{@type:indicator}
input: _setalign(0, "營收財報對位方式", inputkind:=dict(["絕對對位", 0], ["公佈日對位", 1]), quickedit := True);
setalign("營收財報", _setalign);


value1 = getField("每股淨值(元)", "Q", default := value1[1]);
input:ratio1(0.8);
input:ratio2(1);
input:ratio3(1.2);
input:ratio4(1.5);
input:ratio5(1.8);

if value1 <> 0 then value2 = close / value1;

plot1(value2*ratio1, "0.8倍");
plot2(value2*ratio2, "1.0倍");
plot3(value2*ratio3, "1.2倍");
plot4(value2*ratio4, "1.5倍");
plot5(value2*ratio5, "1.8倍");