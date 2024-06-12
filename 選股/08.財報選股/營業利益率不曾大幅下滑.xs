{@type:filter}
input:r1(5, "營業利益率QOQ最大衰退幅度");
input:p1(5, "計算的季期數");

SetTotalBar(p1 + 4);
value1=GetField("營業利益率","Q");
if trueall(value1*(1+r1/100)>value1[1],p1)
then ret=1;
