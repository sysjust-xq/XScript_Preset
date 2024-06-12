{@type:sensor}
input:percent(100);  setinputname(1,"量增比例%");
input:Length(200);  setinputname(2,"均量期數");
input:XLimit(True);  setinputname(3,"限制最低觸發門檻");
input:atVolume(500);  setinputname(4,"最低觸發張數");
input:TXT("建議使用分鐘線"); setinputname(5,"使用說明");

variable: AvgVolume(0);

settotalbar(Length + 3);

AvgVolume=Average(volume,Length);
if XLimit then 
begin
  if Volume > atVolume  and  volume > AvgVolume *(1+ percent/100)  then ret=1;
end
else
begin
  if Volume > Volume[1]  and  volume > AvgVolume *(1+ percent/100)  then ret=1;
end;
