{@type:indicator|@guid:a9e672f187a64f28a761851e4ccabdab|@path:/XQ技術指標/HL-Osc (高低價擺盪指標)|@hash:f231ebe97f48069c00a17e616da116ce}
// XQ: HL-Osc 指標
//
variable: tr(0), hlo(0);

tr = TrueRange;
if tr <> 0 then
	hlo = 100 * (H - C[1]) / tr
else
	hlo = 0;

plot1(hlo, "HL-Osc");

		