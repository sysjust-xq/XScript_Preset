{@type:filter|@guid:b898d713aa32498aa9c2735173e77ec7|@path:/06.籌碼選股/主流股蓄勢待發}
input:days(10);
input: FastLength(12, "DIF短期期數"), SlowLength(26, "DIF長期期數"), MACDLength(9, "MACD期數");
variable: difValue(0), macdValue(0), oscValue(0),Kprice(0);

settotalbar(100);
MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);
if absvalue((average(close,20)-close)/close)*100<2
and absvalue((average(close,60)-close)/close)*100<2
and close=highest(close,days)
and macdvalue>macdvalue[1]
and macdvalue>0
and difvalue>0
then ret=1;
