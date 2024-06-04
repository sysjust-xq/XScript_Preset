{@type:function_bool|@guid:0dfacc591cf44cc7ae661bd5e7040957|@path:/邏輯判斷/Filter|@hash:8ce49c44456dfd055441c6a36a9e9710}
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