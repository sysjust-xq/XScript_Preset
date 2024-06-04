{@type:filter|@guid:f6833770083743bc82535fa8ed7952a5|@path:/08.財報選股/營業利益均線向上}
setbarfreq("Q");
settotalbar(10);
value1=GetField("營業利益","Q");
if linearregslope(average(value1,5),5)>0
then ret=1;