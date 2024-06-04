{@type:filter|@guid:05585eb1e01a43c1becd0bf20d030aa5|@path:/07.月營收選股/月營收YOYN月移動平均大於X}
input:lowlimit(10,"年增率下限");
input:period(12,"移動平均線的期別");

if average(GetField("月營收年增率","M"),period) >= lowlimit
then ret=1;