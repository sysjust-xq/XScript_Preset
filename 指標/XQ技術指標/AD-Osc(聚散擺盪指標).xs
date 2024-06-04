{@type:indicator|@guid:5b578d44ae424b13b10c27895035cd26|@path:/XQ技術指標/AD-Osc(聚散擺盪指標)|@hash:045774c9305c80ec9e281f6ce8db8b85}
// XQ: A/D Osc 指標
// 
variable: bp(0), sp(0), ado(0);

bp = High - Open;
sp = Close - Low;
if High <> low then
	ado = (bp + sp)/(2*(High - Low))*100
else
	ado = 50;

plot1(ado, "A/D-Osc");
		