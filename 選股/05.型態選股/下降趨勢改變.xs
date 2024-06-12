{@type:filter}
input:Length(20); 		setinputname(1,"下降趨勢計算期數");
input:VolLimit(1000);	setinputname(2,"突破量");

variable: kk(0);

settotalbar(maxlist(length, 5) + 3);

If CurrentBar = 1 then
	kk = 0
else
	kk = kk[1] + (close - close[1])/close[1] * Volume;

value1 = linearregslope(kk, Length);
value2 = linearregslope(kk, 5);

IF value1 < 0 and value2 > 0 AND VOLUME > VolLimit then ret=1;

