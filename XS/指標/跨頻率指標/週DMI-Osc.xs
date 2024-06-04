{@type:indicator|@guid:d81ae297f5c44ee0b2afc7c27245d21d|@path:/跨頻率指標/週DMI-Osc|@hash:02c7e82b61d247247ffc31f8b87e522f}
// 跨頻率週DMI-Osc指標
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率週資料，跨頻率計算日DMI-Osc技術指標。
//
if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "W" and barfreq <> "AD" and barfreq <> "AW" then raiseruntimeerror("不支援大頻率跨小頻率");

input: Length( 14 );
variable: pdi_value(0), ndi_value(0), adx_value(0);

SetInputName(1, "天數");

xf_DirectionMovement("W", Length, pdi_value, ndi_value, adx_value);

// 初始區波動較大, 先不繪出
//
if CurrentBar < Length then
 begin
	pdi_value = 0;
	ndi_value = 0;
	adx_value = 0;
 end;

Plot1(pdi_value - ndi_value, "週DMI-Osc");

		