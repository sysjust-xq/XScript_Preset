{@type:function}
SetBarMode(1);

{
 XQ: HL-Osc 指標
}
variable: hlot(0);

if TrueRange <> 0 then
	hlot = 100 * (H - C[1]) / TrueRange
else
	hlot = 0;

hl_osc = hlot;

		