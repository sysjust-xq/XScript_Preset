{@type:indicator}
input: Length(20);	SetInputName(1, "布林通道天數");
input: BandRange(2);SetInputName(2, "上下寬度");
input: MALength(10);SetInputName(3, "MA天期");

variable: up(0), down(0), mid(0);

up = bollingerband(Close, Length, BandRange);
down = bollingerband(Close, Length, -1 * BandRange);

if up - down = 0 then value1 = 0 else value1 = (close - down) * 100 / (up - down);
value2 = average(value1, MALength);

Plot1(value1, "%b");
Plot2(value2, "%b平均");
