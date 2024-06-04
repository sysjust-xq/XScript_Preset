{@type:sensor|@guid:a917126ba9ac42b7ac0022af5354a9f6|@path:/技術分析/MTM背離}
value1=momentum(close,10);
if linearregslope(close,6)<0
and linearregslope(value1,6)>0
and close*1.2<close[20]
then ret=1;