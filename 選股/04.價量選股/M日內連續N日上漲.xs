{@type:filter}
input:day(11);
input:m1(3);
setinputname(1,"計算天期");
setinputname(2,"連續上漲天數");

variable:x(0),count(0);
count=0;
for x=0 to day-m1 
begin
if close[x]>close[x+1]
and close[x+1]>close[x+2]
and close[x+2]>close[x+3]
then count=count+1;
end;
if count>=1
then ret=1;


