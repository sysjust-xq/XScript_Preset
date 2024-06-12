{@type:indicator}
// XQ: HL-Osc 指標
//
variable: tr(0), hlo(0);

tr = TrueRange;
if tr <> 0 then
	hlo = 100 * (H - C[1]) / tr
else
	hlo = 0;

plot1(hlo, "HL-Osc");

		