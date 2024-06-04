{@type:function|@guid:95a5e49d2f6f4d369865c6de85a56469|@path:/邏輯判斷/SummationIF|@hash:9c332d373edadce4b7ccdc780cfdb93e}
SetBarMode(1);

input: TrueAndFalse(truefalseseries), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

_Output = 0;

for Value1 = 0 to Length - 1
begin
    if TrueAndFalse[Value1] then _Output = _Output + thePrice[Value1];
end;

SummationIf = _Output;
        