{@type:filter|@guid:6c196965c4904dad8b18b4dea6642659|@path:/06.籌碼選股/法人大出籌碼|@hash:f0c9a666c8b01da0a8fe57cbd3215519}
input:r1(45);
setinputname(1,"法人賣出佔成交量比例下限%");
value1=GetField("外資賣張","D");
value2=GetField("投信賣張","D");
value3=GetField("自營商賣張","D");
if volume<>0 then 
value4=(value1+value2+value3)/volume;
if value4*100>r1
then ret=1;