{@type:filter}
input:N1(5);
input:N2(16);
setinputname(1,"股利平均的年數");
setinputname(2,"股利的倍數");
value1=GetField("股利合計","Y");
value2=average(value1,N1);
if close<value2*N2
then ret=1;

