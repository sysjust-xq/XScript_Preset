{@type:filter|@guid:3b1746c2e5164494954f12fe6d3e31f3|@path:/03.進階技術分析/趨勢成形}
// ADX趨勢成形
//
input: Length(14), Threshold(25);

variable: pdi_value(0), ndi_value(0), adx_value(0);

SetTotalBar(Length*11);

SetInputName(1, "期數");
SetInputName(2, "穿越值");

DirectionMovement(Length, pdi_value, ndi_value, adx_value);

if adx_value Crosses Above Threshold and close=high
then ret=1;