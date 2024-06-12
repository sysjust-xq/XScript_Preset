{@type:function}
SetBarMode(1);

input: thePrice(numericseries),Length(numericsimple);

variable: highValue(0);
variable: i(0);
variable: barOffset(0);

highValue = thePrice[0];
barOffset = 0;
for i = 1 to Length-1
begin
  if thePrice[i] > highValue then begin
    highValue = thePrice[i];
	barOffset = i;
  end;	
end;

SimpleHighestBar = barOffset; 	
