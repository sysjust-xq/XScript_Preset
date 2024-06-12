{@type:filter}
input:length(20);
variable:up1(0),down1(0),mid1(0),bbandwidth(0);
up1 = bollingerband(Close, Length, 1);
down1 = bollingerband(Close, Length, -1 );
mid1 = (up1 + down1) / 2;

bbandwidth = 100 * (up1 - down1) / mid1;
if bbandwidth crosses above 5 and close > up1 and close> up1[1]
and average(close,20)>average(close,20)[1]
then ret=1;