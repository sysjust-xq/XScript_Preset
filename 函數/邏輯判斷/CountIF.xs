{@type:function|@guid:d80cf92ddfcc42e0a6c53ec47edebd49|@path:/邏輯判斷/CountIF|@hash:b9df22ac83fbe6041570b8acf898c5bf}
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
         