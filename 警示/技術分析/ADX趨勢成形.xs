{@type:sensor}
// ADX趨勢成形
//
input: Length(14), Threshold(25);

variable: pdi_value(0), ndi_value(0), adx_value(0);

settotalbar(maxlist(Length,6) * 13 + 8);

SetInputName(1, "期數");
SetInputName(2, "穿越值");

DirectionMovement(Length, pdi_value, ndi_value, adx_value);

Ret = adx_value Crosses Above Threshold;



