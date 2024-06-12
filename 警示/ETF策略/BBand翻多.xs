{@type:sensor}
input:Length(20,"天數");
input:Up(1,"上");
input:Down(1,"下");
input:Threshold(1,"觸發標準");

variable:up1(0),down1(0),mid1(0),bbandwidth(0);

up1 = bollingerband(Close, Length, absvalue(Up));
down1 = bollingerband(Close, Length, -1 * absvalue(Down));
mid1 = (up1 + down1) / 2;

bbandwidth = 100 * (up1 - down1) / mid1;

if bbandwidth crosses above Threshold then ret = 1;

 