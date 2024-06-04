{@type:function|@guid:9e137cb40fac4dcdaade2efd4d26ba0c|@path:/技術指標/DMO}
SetBarMode(1);

{
DMO指標(Directional Movement Oscillator)以
DMI趨向指標指標中正負DI值，將此二條線合併而成的一條指標線。
Length: 計算期數
}

input: Length(numeric);
variable: pdi_value(0), ndi_value(0), adx_value(0);

DirectionMovement(Length, pdi_value, ndi_value, adx_value);

DMO =(pdi_value - ndi_value);

		