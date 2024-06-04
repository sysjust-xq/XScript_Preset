{@type:sensor|@guid:7767e118fad34a5eb092666b39a7be79|@path:/價量指標/即將漲停|@hash:afcef63c2b8437557426132028d824df}
input: Percent(1);  setinputname(1,"距離漲停百分比");

settotalbar(3);

if close > GetField("漲停價", "D")*(1-Percent/100) then ret =1;