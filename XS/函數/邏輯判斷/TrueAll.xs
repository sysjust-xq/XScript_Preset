{@type:function_bool|@guid:93ec7a47222349e7ba8a2257d29196e4|@path:/邏輯判斷/TrueAll|@hash:20fed0624a3e688fcd5856beac8b5e8b}
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
        