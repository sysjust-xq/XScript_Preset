{@type:function_bool}
SetBarMode(2);

input:  pX(TrueFalseSimple), pLength(NumericSimple);
variable: vCounter(0);

If pX Then begin
	If vCounter < pLength Then begin
			vCounter = vCounter + 1;
			Filter = False;
	end Else begin
			vCounter = 0;
			Filter = True;
	End;
end Else begin
	vCounter = vCounter + 1;
	Filter = False;
End;