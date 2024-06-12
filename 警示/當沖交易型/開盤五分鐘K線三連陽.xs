{@type:sensor}
input:TXT1("僅適用5分鐘線"); setinputname(1,"使用限制");
input:TXT2("開盤前3根K棒"); setinputname(2,"使用說明:判斷規則");
settotalbar(5);
if barfreq<> "Min" or barinterval <> 5 then return;

variable:KBarOfDay(0); KBarOfDay+=1; if date<>date[1] then  KBarOfDay=1; 

if Date = CurrentDate   and
   (time[2] = 90000 or time[2] = 84500) and
   KBarOfDay = 3 and
   Close[2] > Open[2] and 
   TrueAll(Close > Open and Close > Close[1] ,2)  then Ret=1;