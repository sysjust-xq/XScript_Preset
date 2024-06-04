{@type:indicator|@guid:ea5cf57b37f343cd822648293729522d|@path:/技術指標/順勢指標|@hash:e2d79674b345d89008b24516c6d52705}
{
指標說明
https://xstrader.net/為自己的觀察名單標上交易訊號/
}

input:
	length1(5,"短期平均"),
	length2(10,"長期平均");

variable:bp1(0),abp1(0),abp2(0);

bp1=(close-close[1])/truerange*100;
abp1=average(bp1,length1);
abp2=average(bp1,length2);

plot1(abp1,"短期平均");
plot2(abp2,"長期平均");

