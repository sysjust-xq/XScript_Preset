{@type:sensor|@guid:e1937001df104d8ea7ed76cdc572102c|@path:/短線操作型/投信外資同步進場}
input:Fboughts(100); setinputname(1,"外資買超張數");
input:Sboughts(100); setinputname(2,"投信買超張數");
input:TXT1("僅適用日線"); setinputname(3,"使用限制");
settotalbar(3);
if BarFreq <> "D"  then return;
if GetField("外資買賣超")[1]>Fboughts and GetField("投信買賣超")[1]>Sboughts
then ret=1;