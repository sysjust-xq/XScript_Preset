{@type:filter}
input:N(5);

if getfield("除權息日期") = date then
begin
value1 = date;
value2 = c[1];
value3 = currentbar;
end;

if value1 > 0
  AND currentbar - value3 = N - 1
  AND c > value2
then
begin
value4 = date;
value5 = c;
condition1 = true;
end;

if condition1 then ret=1;

outputfield(1,value1,0,"除權息日期");
outputfield(2,value2,2,"除權息前一天收盤");
outputfield(4,value4,0,"N天後日期");
outputfield(5,value5,2,"N天後收盤");