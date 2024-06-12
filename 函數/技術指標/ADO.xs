{@type:function}
SetBarMode(1);

{
Accumulation／Distribution Oscillator，「聚散擺盪」指標。
傳回ADO值
}

variable: bp(0), sp(0), adot(0);

bp = High - Open;
sp = Close - Low;
if High <> low then
	adot = (bp + sp)/(2*(High - Low))*100
else
	adot = 50;

ADO =adot;

		