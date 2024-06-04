{@type:filter|@guid:d4ede89171eb4a7c9e6483bcbb93d698|@path:/03.進階技術分析/天量後價量未再創新高}
input:XLength(60); 	setinputname(1,"長期大量計算期數");
input:Length(3); 	setinputname(2,"超過n日價量未再創新高");

variable: PriceHighBar(0),VolumeHighBar(0);

settotalbar(3);

VolumeHighBar = highestbar(volume, XLength);
PriceHighBar = highestbar(high, Length);

// 近日內成交量創新高, 可是價格沒有創新高
//
if VolumeHighBar > 0 and 
   VolumeHighBar <= Length and
   PriceHighBar = VolumeHighBar then
ret = 1;
