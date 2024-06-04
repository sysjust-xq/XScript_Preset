{@type:sensor|@guid:cd8fb42588ca4a0e9e31584d76b90f17|@path:/3.出場常用警示/階梯式下跌|@hash:34994a2425c13e042b2257e05ff9ba74}
input:TXT("5分鐘線以下"); setinputname(1,"使用限制");

settotalbar(13);

if barfreq<> "Min" or barinterval > 5 then return;

switch (barinterval)
begin
   case 1,2,5:
     if time =091000 and TrueAll(open=high and close=low and close< close[1],10/barinterval) then ret=1;
     break;
   case 3:
     if time =090900 and TrueAll(open=high and close=low and close< close[1],3) then ret=1;
     break;
end;