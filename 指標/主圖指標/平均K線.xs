{@type:indicator}
var: ha_open(0), ha_high(0), ha_low(0), ha_close(0);


if currentbar = 1 then
  ha_open = (open + close) / 2
else
  ha_open = (ha_open[1] + ha_close[1]) / 2;


ha_close = (open + high + low + close) / 4;
ha_high = maxlist(high, ha_open, ha_close);
ha_low = minlist(low, ha_open, ha_close);


PlotK(1, ha_open, ha_high, ha_low, ha_close, "平均K線");
