{@type:sensor|@guid:fead427080de443cbca164a44ea09940|@path:/價量指標/開高帶量走低|@hash:20b27d175416d4a0edf4fdb9bebf3025}
Input: AmountThre(2000); setinputname(1,"開高量(萬)");
variable: initialAmount(0);
variable: intrabarpersist XDate(0);
settotalbar(25);
if Date > XDate then
  begin
	XDate = Date;
	initialAmount = (High+low)/2 * volume/10; //計算K棒成交金額
	if Open > Close[1] and
       (open - close) > (high -low) * 0.75 and 
	   initialAmount > AmountThre then ret = 1;
  end;
  


        
        