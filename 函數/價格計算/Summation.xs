{@type:function|@guid:c122bd6485c544f2bce8f374b5c7440d|@path:/價格計算/Summation|@hash:78af6670ca2e014033c657809f1cbc25}
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
        