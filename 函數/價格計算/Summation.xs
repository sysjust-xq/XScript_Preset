{@type:function}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable:Sum(0),SumLength(0);
Sum=0;

for SumLength = 0 to Length - 1
begin 
    Sum = Sum + thePrice[SumLength];
end;

Summation = Sum;
        