{@type:indicator}
// XQ: DMI-Osc指標
//
input: Length( 14 );
variable: pdi_value(0), ndi_value(0), adx_value(0);

SetInputName(1, "天數");

DirectionMovement(Length, pdi_value, ndi_value, adx_value);

// 初始區波動較大, 先不繪出
//
if CurrentBar < Length then
 begin
	pdi_value = 0;
	ndi_value = 0;
	adx_value = 0;
 end;

Plot1(pdi_value - ndi_value, "DMI-Osc");

		