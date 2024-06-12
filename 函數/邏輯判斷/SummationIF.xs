{@type:function}
SetBarMode(1);

input: TrueAndFalse(truefalseseries), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

_Output = 0;

for Value1 = 0 to Length - 1
begin
    if TrueAndFalse[Value1] then _Output = _Output + thePrice[Value1];
end;

SummationIf = _Output;
        