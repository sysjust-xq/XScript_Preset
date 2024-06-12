{@type:filter}
input:day(10);			setinputname(1,"連續買超天數");
input:amount(100);		setinputname(2,"每日至少買超張數(張)");
input:percent1(3);		setinputname(3,"漲幅上限(%)");

SetTotalBar(3);

if trueall(GetField("法人買賣超張數") > amount, day) and 
   RateOfChange(Close, day) < percent1
then ret=1;

