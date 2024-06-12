{@type:sensor}
Input: Length1(5, "短天期");
Input: Length2(20, "長天期");

value1=highest(high,100);

if value1 > close*1.2
and average(close,Length1) crosses over average(close,Length2)
then ret=1;