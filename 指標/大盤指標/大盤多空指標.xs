{@type:indicator}
{
指標說明
https://xstrader.net/打造自己的大盤多空函數/
}

input:Length(7,"計算天數");
input:LowLimit(5,"外資買超天數");

plot1(tselsindex(Length,LowLimit));