{@type:indicator}
{
指標說明
https://xstrader.net/這個盤接下來到底會不會大跌-建構專屬的大盤儀/
}

input:
	length(10,"短天期"),
	length1(30,"長天期");
	
variable:fis(0),fil(0);
fis=average(volume*(close-close[1]),length);
fil=average(volume*(close-close[1]),length1);

plot1(fis,"短期力度");
plot2(fil,"長期力度");
plot3(fis-fil,"長短力度差");