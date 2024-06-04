{@type:filter|@guid:ec7ac066b57842e68fecdc532b2e8f51|@path:/09.時機操作/台幣升值受災股}
value1=GetField("每股營業額(元)","Y");
value2=GetField("外銷比率","Y");
if value1>20 and value2>90
//每股營收超過20且外銷比率超過九成
then ret=1;

outputfield(1,value1,0,"每股營收");
outputfield(2,value2,0,"外銷比率");



