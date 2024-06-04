{@type:function|@guid:31df812470ed4d30af3a7592649c9054|@path:/技術指標/TRIX|@hash:7e23b69194ea07bb3f696e4ca3fbba8f}
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
