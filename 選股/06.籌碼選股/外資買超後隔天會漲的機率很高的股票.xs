{@type:filter}
input:n(500,"樣本數");
settotalbar(n);
value1=GetField("外資買賣超","D");
variable:x1(0),y(0),c1(0),c2(0),c3(0);
if value1[1]>200 
then begin
x1=1;
c1=c1+1;
//外資買超的次數
end
else x1=0;

if close>open
then begin
y=1;
c2=c2+1;
//上漲的次數
end
else y=0;

if value1[1]>200
and close>open
then c3=c3+1;
//上漲且外資買超的次數

value2=c1/n; //外資買超的機率
value3=c2/n; //上漲的機率
value4=c3/c2;//收紅且外資買超的機率
value5=value4*value3/value2;
if countif(value1[1]>200,n)>20
then ret=1;
outputfield(1,value5*100,0,"外資前一日買超隔天收高的機率");
outputfield(2,c1,0,"上漲次數");
outputfield(3,c2,"外資買超次數");
outputfield(4,c3,0,"上漲且外資買超");





