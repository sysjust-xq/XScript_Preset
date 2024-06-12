{@type:filter}
setbarfreq("AD");

variable:Kprice(0);

if H > O*1.03 and C <O and H = highest(H,255) then Kprice = L;

condition1 = c crosses below Kprice;
condition2 = average(volume[1], 5) >= 500;
ret = condition1 and condition2;

outputfield(1,Kprice,2,"關卡價", order := -1);
