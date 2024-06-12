{@type:filter}
SetBarFreq("AD");

input: Length(20, "計算區間");
input: VolLimit(1000, "成交量限制");

value1 = truerange();
value2 = highest(value1,Length);

SetTotalBar(Length + 3);

if 
	value1 > value2[1] and 
	value1 > value1[1] and 
	close * 1.01 > high and 
	close > close[1] and 
	volume > VolLimit
then ret=1;

outputfield(1,close[1],2,"前波低點", order := -1);

