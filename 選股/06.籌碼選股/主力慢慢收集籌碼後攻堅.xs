{@type:filter}
setbarfreq("AD");

input:period(10,"籌碼計算天期");
 
Value1=GetField("分公司買進家數","D");
value2=GetField("分公司賣出家數","D");
value3=(value2-value1);
//賣出的家數比買進家數多的部份
value4=average(close,5);

if period<>0 then begin
   if countif(value3>30, period)/period >0.7
   then ret=1;
end;

outputfield(1, countif(value3>30, period), 0, "進貨天數", order := 1);
