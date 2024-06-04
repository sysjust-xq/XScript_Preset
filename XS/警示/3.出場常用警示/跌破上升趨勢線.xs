{@type:sensor|@guid:3b1631596e3d4b5caf45eaaef32fc78e|@path:/3.出場常用警示/跌破上升趨勢線|@hash:a71e11ef432473f98eda7f667a6ca2fa}
input:Length(10); setinputname(1,"上升趨勢計算期數");
input:_Angle(30); setinputname(2,"上升趨勢角度");

settotalbar(Length + 3);

variable: TrendAngle(0);
variable: TrendAngleDelta(0);

if Close< Close[1] and Close[1] <Close[2] and Close[Length]>0 then begin

linearreg((high/Close[Length]-1)*100,Length,0,value1,TrendAngle,value3,value4);
 
TrendAngleDelta =TrendAngle-TrendAngle[1];
IF TrendAngleDelta-TrendAngleDelta[1] < -10 and close >Close[Length] THEN RET=1;
  
end;