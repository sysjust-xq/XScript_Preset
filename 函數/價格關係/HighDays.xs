{@type:function}
SetBarMode(1);

// 計算過去幾筆資料內創新高的次數
//
input: length(numeric);		// 計算天期(含當根bar)

variable: tt(0);　　
variable: ix(0); 
variable: currentHigh(0);

tt=0;
currentHigh = high[length-1];

for ix = length-2 downto 0 
begin 
	if ( high[ix] > currentHigh ) then
	begin
		tt+=1;　　
		currentHigh = high[ix];
	end; 
end;

HighDays=tt;