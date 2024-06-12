{@type:indicator}
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

