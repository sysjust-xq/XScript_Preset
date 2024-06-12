{@type:function}
SetBarMode(1);

// 計算過去幾筆資料內創新低的次數
//
input: length(numeric);		// 計算天期(含當根bar)

variable: tt(0);　　
variable: ix(0); 
variable: currentlow(0);

tt=0;
currentlow = low[length-1];

for ix = length-2 downto 0 
begin 
	if ( low[ix] < currentlow ) then
	begin
		tt+=1;　　
		currentlow = low[ix];
	end; 
end;

LowDays=tt;