{@type:filter}
value1=GetField("每股營業額(元)","Y");
value2=GetField("外銷比率","Y");
if value1>20 and value2>90
//每股營收超過20且外銷比率超過九成
then ret=1;

outputfield(1,value1,0,"每股營收");
outputfield(2,value2,0,"外銷比率");



