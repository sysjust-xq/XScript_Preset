{@type:sensor|@guid:3e18992e144b4e0884a005bacf9934d5|@path:/ETF策略/大跌後均線黃金交叉}
Input: Length1(5, "短天期");
Input: Length2(20, "長天期");

value1=highest(high,100);

if value1 > close*1.2
and average(close,Length1) crosses over average(close,Length2)
then ret=1;