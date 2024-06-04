{@type:function|@guid:89f2091af8c84f7bbe02544e9b39138d|@path:/邏輯判斷/AverageIF|@hash:177c505d538a2407f0d40a4e48ecaf3a}
SetBarMode(1);

input: TrueAndFalse(truefalseseries),
       thePrice(numericseries),
	   Length(numericsimple);

variable: variableA(0);
variable:Sum(0);
variableA = 0;
Sum = 0;
for Value1 = 0 to Length - 1
begin
    if TrueAndFalse[Value1] then 
	begin 
		variableA = variableA + 1;
		Sum = Sum + thePrice[Value1];		
	end;	
end;

if variableA > 0 then
  AverageIf = Sum/variableA
else 
  AverageIf = 0;
        