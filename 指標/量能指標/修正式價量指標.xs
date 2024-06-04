{@type:indicator|@guid:e6d4df1f4cbb483eaaa26bc25a74f1b2|@path:/量能指標/修正式價量指標|@hash:5173ecbf4f39a3ddb0151c9eb7d32045}
{
指標說明
https://xstrader.net/修正式價量指標vptvolume-price-trend/
}

input:day(5,"移動平均線天數");

variable:tvp(0),mpc(0);
mpc=(open+high+low+close)/4;
 
if mpc[1]<>0 then
	tvp=tvp[1]+(mpc-mpc[1])/mpc[1]*volume
else
	tvp=tvp[1];

plot1(tvp,"修正型價量指標");
 