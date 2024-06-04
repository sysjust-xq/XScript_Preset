{@type:indicator|@guid:c9a294ef73c640eba3e1eed6ae5f8575|@path:/XQ技術指標/DMI (趨向指標)|@hash:5ef94733c17c4460ba2db2858acacadf}
// XQ: DMI指標
//
input: Length(14);
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
 
Plot1(pdi_value, "+DI");
Plot2(ndi_value, "-DI");
Plot3(adx_value, "ADX");


		