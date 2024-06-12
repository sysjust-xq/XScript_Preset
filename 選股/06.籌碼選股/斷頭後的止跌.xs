{@type:filter}

input:Length(4); setinputname(1,"計算區間");
input:DVOL(3000); setinputname(2,"區間融資減少張數");
input:R1(30);	 setinputname(3,"區間跌幅(%)");	

SetTotalBar(3);

if Close > Close[1] and 
   RateOfChange(Close, Length) < -1 * R1 and
   GetField("融資餘額張數")[Length] - GetField("融資餘額張數") > DVOL 
then ret=1;

