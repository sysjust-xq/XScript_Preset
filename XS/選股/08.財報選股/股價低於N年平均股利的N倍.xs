{@type:filter|@guid:a55bd21b55d74f718b4fe8b3c212e0b5|@path:/08.財報選股/股價低於N年平均股利的N倍}
input:N1(5);
input:N2(16);
setinputname(1,"股利平均的年數");
setinputname(2,"股利的倍數");
value1=GetField("股利合計","Y");
value2=average(value1,N1);
if close<value2*N2
then ret=1;

