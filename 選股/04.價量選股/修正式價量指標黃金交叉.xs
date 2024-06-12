{@type:filter}
setbarfreq("AD");

input:day(10, "移動平均線天數");

variable:tvp(0),mpc(0);
mpc=(open+high+low+close)/4;

if mpc[1]<>0
then tvp=tvp[1]+(mpc-mpc[1])/mpc[1]*volume
else tvp=tvp[1];

value1=average(tvp,day);
If tvp crosses over value1 and volume>1000
and tvp>value1*1.05
then ret=1;

outputfield(1,average(c,day),2,"10日線", order := -1);
