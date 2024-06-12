{@type:function}
SetBarMode(2);

// TRIX function (for TRIX指標)
//
Input: price(numericseries), length(numericsimple);

value1 = XAverage(price, length);
value2 = XAverage(value1, length);
value3 = XAverage(value2, length);
	
if CurrentBar = 1 then
	TRIX = 0
else
begin
    if value3[1] <> 0 then
        TRIX = (value3 - value3[1]) / value3[1]
    else
        TRIX = 0;
end;
