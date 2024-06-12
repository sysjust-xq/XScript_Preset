{@type:function}
SetBarMode(1);

input:TrueAndFalse(truefalseseries), Length(numericsimple);

value2 = 0;

for Value1 = 0 to Length - 1
begin
    if TrueAndFalse[Value1] = true then
        value2 = value2 +1
    else
     begin
        break;
     end;
end;
TrueCount = value2;
       