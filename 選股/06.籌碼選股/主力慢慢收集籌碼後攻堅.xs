{@type:filter|@guid:0d1d69c4ecb54c67b4d11c756937eb4a|@path:/06.籌碼選股/主力慢慢收集籌碼後攻堅}
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
