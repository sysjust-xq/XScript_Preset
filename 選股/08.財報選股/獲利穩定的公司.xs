{@type:filter|@guid:491cb91e0438435f9a8f44f3a7f3ef34|@path:/08.財報選股/獲利穩定的公司}
setbarfreq("Y");
settotalbar(5);
value1=GetField("每股稅後淨利(元)","Y");
if trueall(value1>=2,5)//過去五年每年都賺超過兩元
and highest(value1,5)<lowest(value1,5)*1.5//獲利的高低差距在忍受範圍
then ret=1;
outputfield(1,highest(value1,5),1,"最高EPS");
outputfield(2,lowest(value1,5),1,"最低EPS");