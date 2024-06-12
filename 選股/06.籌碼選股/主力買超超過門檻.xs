{@type:filter}
input: Length(5); 	setinputname(1,"計算天數");
input: limit1(20);	setinputname(2,"買超佔成交量比例");

variable: r1(0), volTotal(0),ratio(0);

SetTotalBar(3);

r1 = summation(GetField("主力買賣超張數"), Length);
volTotal = summation(Volume, Length);

if voltotal<>0 then 
  begin
	ratio = r1 / voltotal * 100;
    if ratio >= limit1 and average(volume,20) > 500 then ret=1;
	
	setoutputname1("主力買賣超比重(%)");
	outputfield1(ratio);
  end;
