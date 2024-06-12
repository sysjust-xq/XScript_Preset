{@type:filter}
input:lowlimit(10,"年增率下限");
input:period(12,"移動平均線的期別");

if average(GetField("月營收年增率","M"),period) >= lowlimit
then ret=1;