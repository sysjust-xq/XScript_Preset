{@type:indicator|@guid:2cdf5c2c26dc478cb58876ba85634c95|@path:/XQ技術指標/DMI-Osc(趨向擺盪線)|@hash:6f06636113db3435eaa5c309e882cd34}
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

		