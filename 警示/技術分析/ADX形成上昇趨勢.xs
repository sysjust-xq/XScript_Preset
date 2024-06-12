{@type:sensor}
input: Length(14, "期數"), Threshold(25, "穿越值");

variable: pdi_value(0), ndi_value(0), adx_value(0);

settotalbar(maxlist(Length,6) * 13 + 8);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;

DirectionMovement(Length, pdi_value, ndi_value, adx_value);

value1=GetField("主力買賣超張數")[Z];
if tselsindex(10,8)[Z]=1
and value1>300
and adx_value Crosses Above Threshold
then ret=1;

