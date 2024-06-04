{@type:sensor|@guid:0d7c1061a28c4d0393aeb037d580a079|@path:/技術分析/第一次站上20週均線}
if barfreq<>"W" then return;
if close crosses over average(close,20)
and barslast(close crosses over average(close,20))[1]
>20
then ret=1;