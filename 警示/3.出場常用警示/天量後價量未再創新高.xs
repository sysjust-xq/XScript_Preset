{@type:sensor}
input:XLength(60); setinputname(1,"長期大量計算期數");
input:Length(3); setinputname(2,"自高點回檔天數");
input:TXT("建議使用日線"); setinputname(3,"使用說明");

variable: PriceHighBar(0),VolumeHighBar(0);

settotalbar(XLength + 3);

extremes(high,Length,1,value1,PriceHighBar);
extremes(volume,XLength,1,value1,VolumeHighBar);

if (PriceHighBar =Length-1) and VolumeHighBar=Length-1  then
ret=1;

