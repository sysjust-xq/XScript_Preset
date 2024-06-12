{@type:filter}
input: Length(100);		setinputname(1,"計算期數");
input: RRatio(100);		setinputname(2,"盤漲最大漲幅%");

settotalbar(3);

variable: Scores(0);

if Close > Open and Close > Close[2]*1.07  {紅棒且累計三天漲幅大於7%}
   and Close < Close[Length]*(1+RRatio/100)  {累計漲幅不超過%}
then 
  begin
	scores = countif(close > close[1], length);
	If scores >= Length / 2 then ret=1;
  end;


 