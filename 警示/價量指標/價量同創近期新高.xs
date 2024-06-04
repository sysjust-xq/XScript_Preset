{@type:sensor|@guid:1ed06dd8f50246e9ad3d07c879496a93|@path:/價量指標/價量同創近期新高|@hash:dfcd723518a0bf2b01f1bfc7e835fb21}
input: Price(close); setinputname(1,"比較價別");
input: Length(20); setinputname(2,"近期期數");

settotalbar(3);
setbarback(Length);

if  Price > highest(high[1] ,Length) and 
    volume > highest(volume[1],length) then ret=1;



