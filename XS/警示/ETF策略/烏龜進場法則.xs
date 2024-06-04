{@type:sensor|@guid:345f0740efe4432cb0563143b22cf3ab|@path:/ETF策略/烏龜進場法則}
if average(close,3) crosses above average(close,55)
and volume> average(volume,5)
and atr(3) > atr(20)
then ret=1;