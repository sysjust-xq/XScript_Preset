{@type:sensor|@guid:6857415b6aff4624a43d3ddb58bcce98|@path:/3.出場常用警示/連續n日開高走低收最低|@hash:07e9e7b1f39976f8fbe925065f41fb32}
input:Length(2); setinputname(1,"計算期數");

settotalbar(Length + 3);

if Trueall( Open > Close[1]*1.005 and Close<open and close = low , Length) then ret=1;