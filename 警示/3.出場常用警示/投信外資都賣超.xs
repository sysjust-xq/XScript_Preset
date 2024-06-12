{@type:sensor}
input:TXT("僅適用日線"); setinputname(1,"使用限制");

settotalbar(3);

if Barfreq <> "D" then return;

if Open < Close[1] and  Close < Close[1] and
   GetField("外資買賣超")[1]<0 and GetField("投信買賣超")[1]<0
then ret=1;

