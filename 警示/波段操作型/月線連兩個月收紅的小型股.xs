{@type:sensor}
input:TXT("僅適用日線","使用限制");

settotalbar(120);

if  GetField("總市值","D")<2000000000 //單位是元
and close<40
and getfield("close","M")[1]>getfield("close","M")[2] 
and getfield("close","M")[2]>getfield("close","M")[3]
then ret=1;
