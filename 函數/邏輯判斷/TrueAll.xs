{@type:function_bool}
SetBarMode(1);

input:TrueAndFalse(truefalseseries), Length(numericsimple);

TrueAll = True;

for Value1 = 0 to Length - 1
begin
    if TrueAndFalse[Value1] = False then
    begin
        TrueAll = False;
        break;
    end;
end;
        