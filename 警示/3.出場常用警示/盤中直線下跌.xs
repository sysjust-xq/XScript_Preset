{@type:sensor}
input:SlopeThre(2); setinputname(1,"下降坡度[2~15越大跌越快]");
input:Length(5); setinputname(2,"計算期數");

settotalbar(Length + 3);

variable:KBarOfDay(0),tOpen(100); KBarOfDay+=1;
if date<>date[1] then begin KBarOfDay=1; tOpen =Open; end;

if Length < KBarOfDay and currentbar > maxbarsback and
   Linearregslope(Low/tOpen*1000,Length) < SlopeThre*-1 then 
ret=1;
