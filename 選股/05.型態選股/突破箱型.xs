{@type:filter}
input:period(20);
input:rangeratio(10);
variable:h1(0),h2(0),l1(0),l2(0),hd1(0),hd2(0),ld1(0),ld2(0);
h1=nthhighest(1,high,period);
h2=nthhighest(2,high,period);
l1=nthlowest(1,low,period);
l2=nthlowest(2,low,period);
hd1=nthhighestbar(1,high,period);
hd2=nthhighestbar(2,high,period);
ld1=nthlowestbar(1,low,period);
ld2=nthlowestbar(2,low,period);
if absvalue(hd1[1]-hd2[1])>=4 and absvalue(ld1[1]-ld2[1])>=4
and h1[1]-h2[1]<=h1[1]*0.02
and l2[1]-l1[1]<=l1[1]*0.02
and h1[1]<=l1[1]*(1+rangeratio/100)
then begin
if close crosses over h1[1]
and volume >=average(volume,period)*1.3
then ret=1;
end;