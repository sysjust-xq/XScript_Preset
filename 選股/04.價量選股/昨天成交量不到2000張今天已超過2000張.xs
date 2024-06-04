{@type:filter|@guid:d2293ce6248941b38cbba8436472205d|@path:/04.價量選股/昨天成交量不到2000張今天已超過2000張}
if volume[1]<2000
and volume>2000
and close=highest(close,20)
then ret=1;