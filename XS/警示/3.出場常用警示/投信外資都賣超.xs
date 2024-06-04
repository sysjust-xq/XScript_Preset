{@type:sensor|@guid:20a7d6d8df424fdf96aa1e0dca436f61|@path:/3.出場常用警示/投信外資都賣超|@hash:3d5731a321042dcb12893fc26d475cc9}
input:TXT("僅適用日線"); setinputname(1,"使用限制");

settotalbar(3);

if Barfreq <> "D" then return;

if Open < Close[1] and  Close < Close[1] and
   GetField("外資買賣超")[1]<0 and GetField("投信買賣超")[1]<0
then ret=1;

