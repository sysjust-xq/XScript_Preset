{@type:filter}
input:Period(5);	setinputname(1,"近期偏弱期間");
input:Rate1(1000);	setinputname(2,"法人及散戶合計賣出上限");
input:Rate2(5000);	setinputname(3,"成交量下限");
input:Ratio(1); 	setinputname(4,"接近低點幅度");

SetTotalBar(3);
 
if Close < Close[Period] and  {近期股價累計為下跌}
   Close < Lowest(Low,Period)* (1+Ratio/100) and {接近期間低點}
   Average(Volume,Period) > Rate2    {偏弱期間均量大於成交量下限}
then 
  begin  
	value1= GetField("法人持股","D") - GetField("法人持股","D")[Period]; {期間法人累計買賣超}
	value2= GetField("融資餘額張數","D") - GetField("融資餘額張數","D")[Period] ; {期間融資累計增減}
	value3= GetField("融券餘額張數","D") - GetField("融券餘額張數","D")[Period];{期間融券累計增減}
 
	if value1 + value2 -value3 >  Rate1 * -1 then ret=1;
  end;
