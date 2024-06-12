{@type:function}
SetBarMode(1);

input:TrueAndFalse(truefalseseries),Length(numericsimple);

variable: variableA(0);

variableA = 0;

for Value1 = 0 to Length - 1
begin
	if TrueAndFalse[Value1] then 	
		variableA = variableA + 1;
end;

CountIf = variableA;
         