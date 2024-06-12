{@type:indicator}
{
指標說明
https://xstrader.net/股性系列之六真實波動區間/
}

input: Length1(3, "短天數");
input: Length2(20,"長天數");

value1 = Average(TrueRange, Length1);
value2 = Average(TrueRange, Length2);

Plot1(value1, "短期ATR");
plot2(value2, "長期ATR");

