{@type:filter}
input:shortPeriod(5);		setinputname(1,"短期平均");
input:midPeriod(12);		setinputname(2,"長期平均");
input:minVolume(2000);		setinputname(3,"成交量門檻");

variable:
	sVolume(0),
	bVolume(0),
	ratio(0),
	ratioAvgShort(0),
	ratioAvgLong(0);

SetTotalBar(MaxList(shortPeriod, midPeriod) + 3);
	
sVolume = GetField("內盤量", "D");//內盤量
bVolume = GetField("外盤量", "D"); //外盤量
if sVolume + bVolume <> 0 then
	ratio = bVolume / (sVolume + bVolume) * 100
else
	ratio = 50;
	
ratioAvgShort = average(ratio,shortPeriod);
ratioAvgLong = average(ratio,midPeriod);

if 
	volume > minVolume and 
	ratioAvgShort < 40 and 
	ratioAvgLong < 40 and 
	absvalue(ratioAvgShort-ratioAvgLong) < 10 and 
	ratioAvgShort crosses above ratioAvgLong
then 
	ret=1; 

