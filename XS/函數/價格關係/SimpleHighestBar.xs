{@type:function|@guid:fc8d76e4eb4f445493deff5405b3d071|@path:/價格關係/SimpleHighestBar}
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
