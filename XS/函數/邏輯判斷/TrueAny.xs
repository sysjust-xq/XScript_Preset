{@type:function_bool|@guid:1a0d56744f5a449ba941cf1b0ca7545f|@path:/邏輯判斷/TrueAny|@hash:5e13bfa75e35f2113e9e9ee00b670f97}
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
        