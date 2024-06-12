{@type:indicator}
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
		