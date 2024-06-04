{@type:sensor|@guid:2c84445ec2f24f30bd249d91bc83569e|@path:/3.出場常用警示/天量後價量未再創新高|@hash:9de8ef4b34f101d1de20e1940524f024}
input:XLength(60); setinputname(1,"長期大量計算期數");
input:Length(3); setinputname(2,"自高點回檔天數");
input:TXT("建議使用日線"); setinputname(3,"使用說明");

variable: PriceHighBar(0),VolumeHighBar(0);

settotalbar(XLength + 3);

extremes(high,Length,1,value1,PriceHighBar);
extremes(volume,XLength,1,value1,VolumeHighBar);

if (PriceHighBar =Length-1) and VolumeHighBar=Length-1  then
ret=1;

