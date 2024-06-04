{@type:sensor|@guid:36c61bab5b2f4a6aa935d2ac7ae18b14|@path:/價量指標/價量同創近期新低|@hash:a63672f78bfdf8392f5a7a00bb6bf03e}
input: Price(close); setinputname(1,"比較價別");
input: Length(20); setinputname(2,"近期期數");

settotalbar(3);
setbarback(Length);

if  Price < lowest(low[1] ,Length) and 
    volume < lowest(volume[1],length) then ret=1;



