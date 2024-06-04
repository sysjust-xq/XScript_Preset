{@type:filter|@guid:f6fee16dfb4345eba0b3664e108a3fb5|@path:/11.選股機器人/天價上影線賣出訊號}
setbarfreq("AD");

variable:Kprice(0);

if H > O*1.03 and C <O and H = highest(H,255) then Kprice = L;

condition1 = c crosses below Kprice;
condition2 = average(volume[1], 5) >= 500;
ret = condition1 and condition2;

outputfield(1,Kprice,2,"關卡價", order := -1);
