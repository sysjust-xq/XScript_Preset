{@type:function}
SetBarMode(1);

input: thePrice(numericseries),Length(numericsimple);

variable: lowValue(0);
variable: i(0);

lowValue = thePrice[0];
for i = 1 to Length-1
begin
  if thePrice[i] < lowValue then
    lowValue = thePrice[i];
end;

SimpleLowest = lowValue; 	
