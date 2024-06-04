{@type:function|@guid:35ecad2f46b642b58d4f6babdfd8e5a7|@path:/價格關係/SimpleLowest}
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
