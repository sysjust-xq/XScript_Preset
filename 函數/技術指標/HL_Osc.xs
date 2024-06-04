{@type:function|@guid:61b9cfcba7814e41a1501a74d5fa20ce|@path:/技術指標/HL_Osc}
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

		