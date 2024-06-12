{@type:filter}
input: Length(100);		Setinputname(1, "區間");
input: UpRatio(2);		SetInputName(2, "當日上漲幅度%");
input: VolLimit(300);	SetInputName(3, "當日成交量下限");

variable: hDate(date),day(0),KeyPrice(0),HighPrice(0);

settotalbar(Length + 3);

if high = highest(high,Length) then hDate = date;

day = datediff(date,hdate);

if day =0 and day[1] > 0 then KeyPrice = Close;

if day >0 and day[1] = 0 then HighPrice = High;

if KeyPrice > 0 and HighPrice > 0 and day > 2 and day <= Length / 2 and 
	Close > Open * (1 + 0.01 * UpRatio) and 
	Close >= highest(High,3) and
	volume > VolLimit and 
	Close > KeyPrice and 
	Close < HighPrice  
then ret=1;


 