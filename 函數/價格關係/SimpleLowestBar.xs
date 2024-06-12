{@type:function}
SetBarMode(1);

input: thePrice(numericseries),Length(numericsimple);

variable: lowValue(0);
variable: i(0);
variable: barOffset(0);

lowValue = thePrice[0];
barOffset = 0;
for i = 1 to Length-1
begin
  if thePrice[i] < lowValue then begin
    lowValue = thePrice[i];
	barOffset = i;
  end;	
end;

SimpleLowestBar = barOffset; 	
