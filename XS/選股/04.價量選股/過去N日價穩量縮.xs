{@type:filter|@guid:176e1f559dfc469ba58d69d74065208c|@path:/04.價量選股/過去N日價穩量縮}
input:days(10,"計算期間");
input:vhilimit(1000,"量的上限");
input:philimit(5,"價格波動上限");
setbarfreq("D");
settotalbar(days);

value1=highest(high,days);
value2=lowest(low,days);
value3=(value1-value2)/value2*100;
if trueall(volume<vhilimit,days)
and trueall(value3<philimit,days)
then ret=1;