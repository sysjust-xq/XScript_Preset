{@type:filter|@guid:6208cf52dad148e9aa9501ab7069ec8b|@path:/08.財報選股/營業利益率不曾大幅下滑}
input:r1(5, "營業利益率QOQ最大衰退幅度");
input:p1(5, "計算的季期數");

SetTotalBar(p1 + 4);
value1=GetField("營業利益率","Q");
if trueall(value1*(1+r1/100)>value1[1],p1)
then ret=1;
