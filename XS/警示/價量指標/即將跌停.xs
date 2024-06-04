{@type:sensor|@guid:9f9132a6a73b4ba8a82b5aa44a5f4a17|@path:/價量指標/即將跌停|@hash:55720fc8602f519b0ffb67b9f0789b25}
input: Percent(1);  setinputname(1,"距離跌停百分比");

settotalbar(3);

if close < GetField("跌停價", "D")*(1+Percent/100) then ret =1;