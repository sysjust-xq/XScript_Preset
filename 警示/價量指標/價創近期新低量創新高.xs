{@type:sensor|@guid:65f538a36738401cab672e2f58a9bf11|@path:/價量指標/價創近期新低量創新高|@hash:3c75f1a57d61a879a037b01a474ba010}
input: Price(close); setinputname(1,"比較價別");
input: Length(20); setinputname(2,"近期期數");

settotalbar(3);
setbarback(Length);

if  Price < lowest(low[1] ,Length) and 
    volume > highest(volume[1],length) then ret=1;



	