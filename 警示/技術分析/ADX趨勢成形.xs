{@type:sensor|@guid:3f07726e5ecb4af38f07b1f6326e1ad6|@path:/技術分析/ADX趨勢成形|@hash:65bbafed0a90b0aa66e79564a1cc540d}
// ADX趨勢成形
//
input: Length(14), Threshold(25);

variable: pdi_value(0), ndi_value(0), adx_value(0);

settotalbar(maxlist(Length,6) * 13 + 8);

SetInputName(1, "期數");
SetInputName(2, "穿越值");

DirectionMovement(Length, pdi_value, ndi_value, adx_value);

Ret = adx_value Crosses Above Threshold;



