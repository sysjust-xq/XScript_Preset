{@type:sensor|@guid:46600a33cc9e415a993d8bea1a09bf10|@path:/3.出場常用警示/盤中直線下跌|@hash:1a1f7fe6065183233d2f1b6c74657828}
input:SlopeThre(2); setinputname(1,"下降坡度[2~15越大跌越快]");
input:Length(5); setinputname(2,"計算期數");

settotalbar(Length + 3);

variable:KBarOfDay(0),tOpen(100); KBarOfDay+=1;
if date<>date[1] then begin KBarOfDay=1; tOpen =Open; end;

if Length < KBarOfDay and currentbar > maxbarsback and
   Linearregslope(Low/tOpen*1000,Length) < SlopeThre*-1 then 
ret=1;
