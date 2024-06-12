{@type:sensor}

// ADX趨勢成形
// 用有量的中小型股，5%停利，5%停損
 
if GetSymbolField("tse.tw","收盤價")
> average(GetSymbolField("tse.tw","收盤價"),10) 
//大盤OK
then begin
input: Length(14,"期數"), Threshold(25,"穿越值");
 
variable: pdi_value(0), ndi_value(0), adx_value(0);
 
  
DirectionMovement(Length, pdi_value, ndi_value, adx_value);
 
if adx_value Crosses Above Threshold
//adx趨勢成形
and pdi_value>ndi_value
//+DI>-DI
and close <close[30]
then ret=1;
end;