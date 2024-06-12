{@type:indicator}
{
指標說明
https://xstrader.net/築底指標-2/
}

input:
	period(125,"計算期數"),
	length1(5,"短MA期數"),
	length2(20,"長MA期數");
	
variable:zd(0),zdma1(0),zdma2(0);

zd=countif(close>=close[1],period)/countif(close<close[1],period);
zdma1=average(zd,length1);
zdma2=average(zd,length2);

plot1(zdma1,"短天期築底指標");
plot2(zdma2,"長天期築底指標");
plot3(1,"多空分界");



 