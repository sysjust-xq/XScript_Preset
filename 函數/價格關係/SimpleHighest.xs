{@type:function|@guid:356e05c9c03640b798c80a02e175aed1|@path:/價格關係/SimpleHighest}
SetBarMode(1);

input: thePrice(numericseries),Length(numericsimple);

variable: highValue(0);
variable: i(0);

highValue = thePrice[0];
for i = 1 to Length-1
begin
  if thePrice[i] > highValue then
    highValue = thePrice[i];
end;

SimpleHighest = highValue; 	

