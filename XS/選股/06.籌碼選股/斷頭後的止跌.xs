{@type:filter|@guid:1fd5be493dff48c787bd5dcf583eeb2b|@path:/06.籌碼選股/斷頭後的止跌}

input:Length(4); setinputname(1,"計算區間");
input:DVOL(3000); setinputname(2,"區間融資減少張數");
input:R1(30);	 setinputname(3,"區間跌幅(%)");	

SetTotalBar(3);

if Close > Close[1] and 
   RateOfChange(Close, Length) < -1 * R1 and
   GetField("融資餘額張數")[Length] - GetField("融資餘額張數") > DVOL 
then ret=1;

