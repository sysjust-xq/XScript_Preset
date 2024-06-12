{@type:indicator}
{
指標說明
https://xstrader.net/dkx多空線/
}

input:length(10,"MA期數");

variable:MID(0),midsum(0),DKX(0),DKXMA(0),r1(0);

MID=(close*3+open+high+low)/6;

DKX=WMA(MID,20);
dkxma=average(dkx,length);

plot1(close,"收盤價");
plot2(dkxma,"多空線的移動平均線");






