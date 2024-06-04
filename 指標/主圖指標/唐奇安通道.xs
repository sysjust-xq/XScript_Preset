{@type:indicator|@guid:e27cdafa02a84df4b529a3f139faec41|@path:/主圖指標/唐奇安通道|@hash:090b7eff05148633d327085e25626020}
{
指標說明
https://xstrader.net/唐奇安通道/
}

input:Period(13,"天數");

value1 = Highest(H, period);
value2 = Lowest(L, period);

plot1(value1[1],"通道上緣");
plot2((value1+value2)/2,"通道中線");
plot3(value2[1],"通道下緣" );
