{@type:function_bool}
SetBarMode(1);

input:TrueAndFalse(truefalseseries), Length(numericsimple);

TrueAny = False;

for Value1 = 0 to Length - 1
begin
    if TrueAndFalse[Value1] then
    begin
        TrueAny = True;
        break;
    end;
end;
        