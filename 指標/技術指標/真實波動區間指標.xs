{@type:indicator|@guid:81b8594242d04d2080c9e95eafc1dc57|@path:/技術指標/真實波動區間指標|@hash:8ae670b23d6785e26d6e5371e6a315cd}
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

