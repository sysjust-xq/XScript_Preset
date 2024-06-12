{@type:function}
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

