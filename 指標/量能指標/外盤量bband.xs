{@type:indicator}
{
指標說明
https://xstrader.net/外盤量異常突出的買進策略/
}

input:length(20,"期數");

variable:bv(0),bva(0);

if volume<>0 then 
	bv=GetField("外盤量")/volume*100;
bva=average(bv,3);

variable:up1(0),down1(0),mid1(0),bbandwidth(0);

up1 = bollingerband(bva, Length, 1);
down1 = bollingerband(bva, Length, -1 );
mid1 = (up1 + down1) / 2;
if mid1<>0 then 
	bbandwidth = 100 * (up1 - down1) / mid1;

plot1(up1, "UB");
plot2(bva, "外盤量佔比");
plot3(down1, "LB");
plot4(bbandwidth, "BW");
